try:
    import xml.etree.cElementTree as etree
except ImportError:
    import xml.etree.ElementTree as etree

from contextlib import closing
from urllib2 import urlopen
from itertools import chain
from collections import defaultdict, OrderedDict



class OpenGLSpec(object):
    URL = 'https://cvs.khronos.org/svn/repos/ogl/trunk/doc/registry/public/api/gl.xml'

    def __init__(self, root):
        self.root = root

        self._types = None
        self._groups = None
        self._enums = None
        self._commands = None
        self._features = None
        self._extensions = None

        self._profile = 'compatability'
        self._remove = set()

    @classmethod
    def from_url(cls, url):
        raw = ''
        with closing(urlopen(url)) as f:
            raw = f.read()

        return cls(etree.fromstring(raw))

    @classmethod
    def from_opengl(cls):
        return cls.from_url(cls.URL)

    @classmethod
    def fromstring(cls, string):
        return cls(etree.fromstring(raw))

    @classmethod
    def from_file(cls, path):
        return cls(etree.parse(path).getroot())

    @property
    def profile(self):
        return self._profile

    @profile.setter
    def profile(self, value):
        if not value in ('core', 'compatability'):
            raise ValueError('profile must either be core or compatability')

        self._profile = value

    @property
    def removed(self):
        if self._profile == 'core':
            return frozenset(self._remove)
        return frozenset()

    @property
    def comment(self):
        return self.root.find('comment').text

    @property
    def types(self):
        if self._types is None:
            self._types = [Type(element) for element in self.root.iter('types')]
        return self._types

    @property
    def groups(self):
        if self._groups is None:
            self._groups = dict([(element.attrib['name'], Group(element))
                                 for element in self.root.find('groups')])
        return self._groups

    @property
    def commands(self):
        if self._commands is None:
            self._commands = dict([(element.find('proto').find('name').text,
                                    Command(element, self))
                                   for element in self.root.find('commands')])
        return self._commands

    @property
    def enums(self):
        if not self._enums is None:
            return self._enums

        self._enums = dict()
        for element in self.root.iter('enums'):
            namespace = element.attrib['namespace']
            type = element.get('type')
            group = element.get('group')
            vendor = element.get('vendor')
            comment = element.get('comment', '')

            for enum in element:
                if enum.tag == 'unused':
                    continue
                assert enum.tag == 'enum'

                name = enum.attrib['name']
                self._enums[name] = Enum(name, enum.attrib['value'], namespace,
                                         type, group, vendor, comment)

        return self._enums

    @property
    def features(self):
        if not self._features is None:
            return self._features

        self._features = defaultdict(OrderedDict)
        for element in self.root.iter('feature'):
            num = tuple(map(int, element.attrib['number'].split('.')))
            self._features[element.attrib['api']][num] = Feature(element, self)

        return self._features

    @property
    def extensions(self):
        if not self._extensions is None:
            return self._extensions

        self._extensions = defaultdict(dict)
        for element in self.root.find('extensions'):
            for api in element.attrib['supported'].split('|'):
                self._extensions[api][element.attrib['name']] = Extension(element, self)

        return self._extensions


class Type(object):
    def __init__(self, element):
        self.raw = ''.join(element.itertext())

    @property
    def is_preprocessor(self):
        return '#' in self.raw

class Group(object):
    def __init__(self, element):
        self.name = element.attrib['name']
        self.enums = [enum.attrib['name'] for enum in element]


class Enum(object):
    def __init__(self, name, value, namespace, type = None,
                 group = None, vendor = None, comment = ''):
        self.name = name
        self.value = value
        self.namespace = namespace
        self.type = type
        self.group = group
        self.vendor = vendor
        self.comment = comment

    def __hash__(self):
        return hash(self.name)

    def __str__(self):
        return self.name
    __repr__ = __str__


class Command(object):
    def __init__(self, element, spec):
        self.proto = Proto(element.find('proto'))
        self.params = [Param(ele, spec) for ele in element.iter('param')]

    def __hash__(self):
        return hash(self.proto.name)

    def __str__(self):
        return '{self.proto.name}'.format(self=self)
    __repr__ = __str__


class Proto(object):
    def __init__(self, element):
        self.name = element.find('name').text
        self.ret = OGLType(element)

    def __str__(self):
        return '{self.ret} {self.name}'.format(self=self)


class Param(object):
    def __init__(self, element, spec):
        self.group = element.get('group')
        self.type = OGLType(element)
        self.name = element.find('name').text


    def __str__(self):
        return '{0!r} {1}'.format(self.type, self.name)


class OGLType(object):
    def __init__(self, element):
        text = ''.join(element.itertext())
        self.type = (text.strip().strip('const').strip().split(None, 1)[0]
                if element.find('ptype') is None else element.find('ptype').text)
        self.is_pointer = 0 if text is None else text.count('*')
        self.is_const = False if text is None else 'const' in text

    def to_d(self):

        if self.is_pointer > 1 and self.is_const:
            s = 'const({}*)'.format(self.type)
            s += '*'*(self.is_pointer-1)
        else:
            s = 'const({})'.format(self.type) if self.is_const else self.type
            s += '*'*self.is_pointer
        return s.replace('struct ', '')
    to_volt = to_d

    def to_c(self):
        s = 'const {}'.format(self.type) if self.is_const else self.type
        s += '*'*self.is_pointer
        return s

    __str__ = to_d
    __repr__ = __str__


class Extension(object):
    def __init__(self, element, spec):
        self.name = element.attrib['name']

        self.require = []
        for required in chain.from_iterable(element.findall('require')):
            if required.tag == 'type': continue

            data = { 'enum' : spec.enums, 'command' : spec.commands }[required.tag]
            try:
                self.require.append(data[required.attrib['name']])
            except KeyError:
                pass # TODO

    @property
    def enums(self):
        for r in self.require:
            if isinstance(r, Enum):
                yield r

    @property
    def functions(self):
        for r in self.require:
            if isinstance(r, Command):
                yield r

    def __hash__(self):
        return hash(self.name)

    def __str__(self):
        return self.name
    __repr__ = __str__


class Feature(Extension):
    def __init__(self, element, spec):
        Extension.__init__(self, element, spec)
        self.spec = spec

        for removed in chain.from_iterable(element.findall('remove')):
            if removed.tag == 'type': continue

            data = { 'enum' : spec.enums, 'command' : spec.commands }[removed.tag]
            try:
                spec._remove.add(data[removed.attrib['name']])
            except KeyError:
                pass # TODO

        self.number = tuple(map(int, element.attrib['number'].split('.')))
        self.api = element.attrib['api']

    def __str__(self):
        return '{self.name}@{self.number!r}'.format(self=self)

    @property
    def enums(self):
        for enum in super(Feature, self).enums:
            if not enum in self.spec.removed:
                yield enum
    @property
    def functions(self):
        for func in super(Feature, self).functions:
            if not func in self.spec.removed:
                yield func

    __repr__ = __str__