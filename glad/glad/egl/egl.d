module glad.egl.egl;


public import glad.egl.types;
public import glad.egl.funcs :
eglGetConfigAttrib, eglCreatePixmapSurface, eglMakeCurrent, eglTerminate, eglBindTexImage, 
eglQueryString, eglGetCurrentContext, eglGetProcAddress, eglCreatePbufferSurface, eglDestroySurface, 
eglWaitClient, eglGetError, eglDestroyContext, eglCreateContext, eglWaitGL, 
eglSwapInterval, eglSwapBuffers, eglBindAPI, eglCreateWindowSurface, eglReleaseThread, 
eglSurfaceAttrib, eglGetCurrentSurface, eglInitialize, eglChooseConfig, eglReleaseTexImage, 
eglQueryAPI, eglQueryContext, eglGetConfigs, eglGetCurrentDisplay, eglGetDisplay, 
eglCreatePbufferFromClientBuffer, eglCopyBuffers, eglWaitNative, eglQuerySurface;

public import glad.egl.ext :
eglCreateFenceSyncNV, eglStreamAttribKHR, eglCreatePlatformPixmapSurfaceEXT, eglLockSurfaceKHR, eglDupNativeFenceFDANDROID, 
eglExportDRMImageMESA, eglQueryStreamKHR, eglPostSubBufferNV, eglSignalSyncKHR, eglDestroySyncKHR, 
eglGetSystemTimeNV, eglCreatePixmapSurfaceHI, eglWaitSyncKHR, eglDestroyImageKHR, eglUnlockSurfaceKHR, 
eglGetSyncAttribNV, eglClientWaitSyncKHR, eglGetSystemTimeFrequencyNV, eglClientWaitSyncNV, eglCreateStreamProducerSurfaceKHR, 
eglGetPlatformDisplayEXT, eglGetSyncAttribKHR, eglCreateStreamFromFileDescriptorKHR, eglCreateDRMImageMESA, eglSignalSyncNV, 
eglQueryNativeWindowNV, eglQueryStreamu64KHR, eglCreateSyncKHR, eglCreateStreamKHR, eglFenceNV, 
eglGetStreamFileDescriptorKHR, eglSetBlobCacheFuncsANDROID, eglStreamConsumerReleaseKHR, eglQueryNativePixmapNV, eglSwapBuffersWithDamageEXT, 
eglQuerySurfacePointerANGLE, eglDestroyStreamKHR, eglCreateImageKHR, eglStreamConsumerAcquireKHR, eglStreamConsumerGLTextureExternalKHR, 
eglCreateStreamSyncNV, eglQueryStreamTimeKHR, eglCreatePlatformWindowSurfaceEXT, eglQueryNativeDisplayNV, eglDestroySyncNV
;

public import glad.egl.enums :
EGL_TRANSPARENT_BLUE_VALUE, EGL_STREAM_BIT_KHR, EGL_SYNC_NATIVE_FENCE_ANDROID, EGL_SIGNALED_KHR, EGL_NO_STREAM_KHR, 
EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_KHR, EGL_NO_SYNC_KHR, EGL_PIXMAP_BIT, EGL_COVERAGE_BUFFERS_NV, EGL_CONDITION_SATISFIED_NV, 
EGL_VG_ALPHA_FORMAT_PRE_BIT, EGL_BAD_PARAMETER, EGL_ALPHA_MASK_SIZE, EGL_NATIVE_VISUAL_ID, EGL_NONE, 
EGL_SYNC_CONDITION_KHR, EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT_KHR, EGL_UNSIGNALED_KHR, EGL_MULTISAMPLE_RESOLVE, EGL_OPENVG_BIT, 
EGL_BITMAP_ORIGIN_KHR, EGL_FOREVER_KHR, EGL_CONTEXT_MAJOR_VERSION_KHR, EGL_SAMPLE_BUFFERS, EGL_BUFFER_AGE_EXT, 
EGL_DRAW, EGL_DRM_BUFFER_FORMAT_MESA, EGL_COVERAGE_SAMPLES_NV, EGL_LARGEST_PBUFFER, EGL_BAD_SURFACE, 
EGL_OPENVG_API, EGL_CONFORMANT_KHR, EGL_CONTEXT_PRIORITY_LEVEL_IMG, EGL_DRM_BUFFER_USE_SHARE_MESA, EGL_YUV_CHROMA_SITING_0_5_EXT, 
EGL_SAMPLES, EGL_VG_PARENT_IMAGE_KHR, EGL_TRANSPARENT_TYPE, EGL_BAD_STREAM_KHR, EGL_SYNC_REUSABLE_KHR, 
EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_EXT, EGL_NO_CONTEXT, EGL_COLOR_FORMAT_HI, EGL_CONTEXT_MINOR_VERSION_KHR, EGL_TEXTURE_RGBA, 
EGL_MATCH_NATIVE_PIXMAP, EGL_BAD_CONTEXT, EGL_SIGNALED_NV, EGL_RENDERABLE_TYPE, EGL_CONTEXT_PRIORITY_HIGH_IMG, 
EGL_DMA_BUF_PLANE1_PITCH_EXT, EGL_NO_RESET_NOTIFICATION_EXT, EGL_FALSE, EGL_CONTEXT_CLIENT_TYPE, EGL_MAP_PRESERVE_PIXELS_KHR, 
EGL_BUFFER_PRESERVED, EGL_YUV_CHROMA_HORIZONTAL_SITING_HINT_EXT, EGL_VG_ALPHA_FORMAT_NONPRE, EGL_DEFAULT_DISPLAY, EGL_CONTEXT_OPENGL_ROBUST_ACCESS_BIT_KHR, 
EGL_LUMINANCE_BUFFER, EGL_NO_SYNC_NV, EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE, EGL_OPENVG_IMAGE, EGL_COLORSPACE_LINEAR, 
EGL_GL_TEXTURE_LEVEL_KHR, EGL_CONSUMER_LATENCY_USEC_KHR, EGL_CORE_NATIVE_ENGINE, EGL_TEXTURE_FORMAT, EGL_COLORSPACE, 
EGL_COLORSPACE_sRGB, EGL_WIDTH, EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X_KHR, EGL_STREAM_STATE_OLD_FRAME_AVAILABLE_KHR, EGL_BAD_NATIVE_PIXMAP, 
EGL_CLIENT_APIS, EGL_POST_SUB_BUFFER_SUPPORTED_NV, EGL_READ, EGL_VG_ALPHA_FORMAT_PRE, EGL_TRUE, 
EGL_ALPHA_SIZE, EGL_VERTICAL_RESOLUTION, EGL_LOSE_CONTEXT_ON_RESET_EXT, EGL_CONTEXT_PRIORITY_LOW_IMG, EGL_ALREADY_SIGNALED_NV, 
EGL_SYNC_CL_EVENT_COMPLETE_KHR, EGL_MAX_PBUFFER_HEIGHT, EGL_SYNC_PRIOR_COMMANDS_COMPLETE_NV, EGL_FORMAT_RGB_565_KHR, EGL_CONTEXT_FLAGS_KHR, 
EGL_TIMEOUT_EXPIRED_NV, EGL_COVERAGE_SAMPLE_RESOLVE_DEFAULT_NV, EGL_BIND_TO_TEXTURE_RGBA, EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z_KHR, EGL_RGB_BUFFER, 
EGL_SWAP_BEHAVIOR_PRESERVED_BIT, EGL_NATIVE_RENDERABLE, EGL_BIND_TO_TEXTURE_RGB, EGL_ITU_REC709_EXT, EGL_CONTEXT_OPENGL_PROFILE_MASK_KHR, 
EGL_UNSIGNALED_NV, EGL_YUV_CHROMA_SITING_0_EXT, EGL_RECORDABLE_ANDROID, EGL_IMAGE_PRESERVED_KHR, EGL_MULTISAMPLE_RESOLVE_BOX, 
EGL_NO_TEXTURE, EGL_OPENGL_ES_BIT, EGL_NATIVE_PIXMAP_KHR, EGL_BITMAP_PIXEL_ALPHA_OFFSET_KHR, EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_KHR, 
EGL_DEPTH_ENCODING_NV, EGL_GL_TEXTURE_2D_KHR, EGL_MAX_PBUFFER_WIDTH, EGL_LINUX_DRM_FOURCC_EXT, EGL_NATIVE_BUFFER_ANDROID, 
EGL_LOWER_LEFT_KHR, EGL_OPENGL_ES_API, EGL_SYNC_FENCE_KHR, EGL_SURFACE_TYPE, EGL_COLOR_BUFFER_TYPE, 
EGL_DMA_BUF_PLANE2_PITCH_EXT, EGL_STREAM_STATE_EMPTY_KHR, EGL_STREAM_STATE_NEW_FRAME_AVAILABLE_KHR, EGL_FOREVER_NV, EGL_YUV_FULL_RANGE_EXT, 
EGL_ALPHA_FORMAT, EGL_ITU_REC2020_EXT, EGL_DISCARD_SAMPLES_ARM, EGL_TEXTURE_RGB, EGL_OPENGL_BIT, 
EGL_OPENGL_API, EGL_MAX_PBUFFER_PIXELS, EGL_BAD_CONFIG, EGL_NO_IMAGE_KHR, EGL_VERSION, 
EGL_DRM_BUFFER_USE_SCANOUT_MESA, EGL_DMA_BUF_PLANE0_PITCH_EXT, EGL_FRAMEBUFFER_TARGET_ANDROID, EGL_CLIENT_PIXMAP_POINTER_HI, EGL_SYNC_CL_EVENT_KHR, 
EGL_LOSE_CONTEXT_ON_RESET_KHR, EGL_TEXTURE_TARGET, EGL_SYNC_TYPE_KHR, EGL_MATCH_FORMAT_KHR, EGL_EXTENSIONS, 
EGL_VG_ALPHA_FORMAT_PRE_BIT_KHR, EGL_NOT_INITIALIZED, EGL_DRM_BUFFER_MESA, EGL_VG_COLORSPACE, EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE_BIT_KHR, 
EGL_ALPHA_FORMAT_PRE, EGL_PRODUCER_FRAME_KHR, EGL_SLOW_CONFIG, EGL_BITMAP_PIXEL_SIZE_KHR, EGL_BLUE_SIZE, 
EGL_GL_TEXTURE_3D_KHR, EGL_DRM_BUFFER_USE_MESA, EGL_VG_COLORSPACE_LINEAR_BIT, EGL_CONTEXT_OPENGL_DEBUG_BIT_KHR, EGL_SAMPLE_RANGE_HINT_EXT, 
EGL_STENCIL_SIZE, EGL_BUFFER_DESTROYED, EGL_SYNC_FLUSH_COMMANDS_BIT_NV, EGL_CONDITION_SATISFIED_KHR, EGL_BAD_ALLOC, 
EGL_BUFFER_SIZE, EGL_NATIVE_VISUAL_TYPE, EGL_DMA_BUF_PLANE1_FD_EXT, EGL_SWAP_BEHAVIOR, EGL_BITMAP_PIXEL_BLUE_OFFSET_KHR, 
EGL_STREAM_TIME_NOW_KHR, EGL_FORMAT_RGB_565_EXACT_KHR, EGL_TRANSPARENT_RED_VALUE, EGL_SYNC_FLUSH_COMMANDS_BIT_KHR, EGL_NO_FILE_DESCRIPTOR_KHR, 
EGL_LEVEL, EGL_GL_TEXTURE_ZOFFSET_KHR, EGL_UNKNOWN, EGL_OPENGL_ES2_BIT, EGL_VG_COLORSPACE_LINEAR, 
EGL_OPTIMAL_FORMAT_BIT_KHR, EGL_BACK_BUFFER, EGL_DMA_BUF_PLANE1_OFFSET_EXT, EGL_BAD_STATE_KHR, EGL_SYNC_PRIOR_COMMANDS_COMPLETE_KHR, 
EGL_CL_EVENT_HANDLE_KHR, EGL_DMA_BUF_PLANE2_FD_EXT, EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT_KHR, EGL_BITMAP_PIXEL_GREEN_OFFSET_KHR, EGL_TEXTURE_2D, 
EGL_CONFORMANT, EGL_UPPER_LEFT_KHR, EGL_CONSUMER_ACQUIRE_TIMEOUT_USEC_KHR, EGL_BITMAP_PITCH_KHR, EGL_COLOR_ARGB_HI, 
EGL_SYNC_NEW_FRAME_NV, EGL_LUMINANCE_SIZE, EGL_CONTEXT_PRIORITY_MEDIUM_IMG, EGL_FORMAT_RGBA_8888_KHR, EGL_MAX_SWAP_INTERVAL, 
EGL_YUV_COLOR_SPACE_HINT_EXT, EGL_STREAM_STATE_CONNECTING_KHR, EGL_MIN_SWAP_INTERVAL, EGL_DEPTH_ENCODING_NONE_NV, EGL_COLOR_RGBA_HI, 
EGL_PIXEL_ASPECT_RATIO, EGL_SUCCESS, EGL_WINDOW_BIT, EGL_MULTISAMPLE_RESOLVE_DEFAULT, EGL_SYNC_STATUS_KHR, 
EGL_BITMAP_PIXEL_LUMINANCE_OFFSET_KHR, EGL_MIPMAP_LEVEL, EGL_WRITE_SURFACE_BIT_KHR, EGL_NO_SURFACE, EGL_TIMEOUT_EXPIRED_KHR, 
EGL_SYNC_STATUS_NV, EGL_GREEN_SIZE, EGL_RENDER_BUFFER, EGL_CONTEXT_OPENGL_ROBUST_ACCESS_EXT, EGL_BAD_ACCESS, 
EGL_BITMAP_PIXEL_RED_OFFSET_KHR, EGL_BAD_CURRENT_SURFACE, EGL_SYNC_CONDITION_NV, EGL_DISPLAY_SCALING, EGL_STREAM_STATE_CREATED_KHR, 
EGL_CONFIG_ID, EGL_BAD_NATIVE_WINDOW, EGL_CONFIG_CAVEAT, EGL_LINUX_DMA_BUF_EXT, EGL_FORMAT_RGBA_8888_EXACT_KHR, 
EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X_KHR, EGL_COVERAGE_SAMPLE_RESOLVE_NV, EGL_MULTIVIEW_VIEW_COUNT_EXT, EGL_STREAM_TIME_CONSUMER_KHR, EGL_PLATFORM_X11_EXT, 
EGL_MIPMAP_TEXTURE, EGL_SYNC_TYPE_NV, EGL_BAD_MATCH, EGL_CONTEXT_CLIENT_VERSION, EGL_VG_COLORSPACE_LINEAR_BIT_KHR, 
EGL_YUV_NARROW_RANGE_EXT, EGL_ALPHA_FORMAT_NONPRE, EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y_KHR, EGL_STREAM_STATE_KHR, EGL_READ_SURFACE_BIT_KHR, 
EGL_BAD_ATTRIBUTE, EGL_LOCK_SURFACE_BIT_KHR, EGL_NO_RESET_NOTIFICATION_KHR, EGL_GL_RENDERBUFFER_KHR, EGL_DRM_BUFFER_STRIDE_MESA, 
EGL_AUTO_STEREO_NV, EGL_SYNC_NATIVE_FENCE_FD_ANDROID, EGL_TRANSPARENT_RGB, EGL_BITMAP_POINTER_KHR, EGL_SYNC_FENCE_NV, 
EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_KHR, EGL_ITU_REC601_EXT, EGL_HEIGHT, EGL_BAD_DISPLAY, EGL_NO_NATIVE_FENCE_FD_ANDROID, 
EGL_STREAM_TIME_PRODUCER_KHR, EGL_DONT_CARE, EGL_PBUFFER_BIT, EGL_DRM_BUFFER_FORMAT_ARGB32_MESA, EGL_DMA_BUF_PLANE2_OFFSET_EXT, 
EGL_HORIZONTAL_RESOLUTION, EGL_OPENGL_ES3_BIT_KHR, EGL_COLOR_RGB_HI, EGL_RED_SIZE, EGL_VENDOR, 
EGL_CONSUMER_FRAME_KHR, EGL_SINGLE_BUFFER, EGL_DMA_BUF_PLANE0_FD_EXT, EGL_DEPTH_ENCODING_NONLINEAR_NV, EGL_LOCK_USAGE_HINT_KHR, 
EGL_MULTISAMPLE_RESOLVE_BOX_BIT, EGL_VG_ALPHA_FORMAT, EGL_PLATFORM_X11_SCREEN_EXT, EGL_CONTEXT_LOST, EGL_STREAM_STATE_DISCONNECTED_KHR, 
EGL_DEPTH_SIZE, EGL_DMA_BUF_PLANE0_OFFSET_EXT, EGL_SYNC_NATIVE_FENCE_SIGNALED_ANDROID, EGL_TRANSPARENT_GREEN_VALUE, EGL_NON_CONFORMANT_CONFIG, 
EGL_STREAM_FIFO_LENGTH_KHR, EGL_YUV_CHROMA_VERTICAL_SITING_HINT_EXT, EGL_COVERAGE_SAMPLE_RESOLVE_NONE_NV, EGL_VG_COLORSPACE_sRGB, EGL_NO_DISPLAY
;
