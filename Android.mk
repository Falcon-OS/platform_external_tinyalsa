LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= mixer.c pcm.c
LOCAL_MODULE := libtinyalsa
LOCAL_SHARED_LIBRARIES:= libcutils libutils
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
include $(BUILD_SHARED_LIBRARY)

ifeq ($(HOST_OS), linux)
include $(CLEAR_VARS)
LOCAL_SRC_FILES:= mixer.c pcm.c
LOCAL_MODULE := libtinyalsa
LOCAL_STATIC_LIBRARIES:= libcutils libutils
LOCAL_CFLAGS += -Werror
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
include $(BUILD_HOST_STATIC_LIBRARY)
endif

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= tinyplay.c
LOCAL_MODULE := tinyplay
LOCAL_SHARED_LIBRARIES:= libcutils libutils libtinyalsa
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror
include $(BUILD_EXECUTABLE)

ifeq ($(HOST_OS), linux)
include $(CLEAR_VARS)
LOCAL_SRC_FILES:= tinyplay.c
LOCAL_MODULE := tinyplay
LOCAL_STATIC_LIBRARIES:= libcutils libutils libtinyalsa
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror
include $(BUILD_HOST_EXECUTABLE)
endif

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= tinycap.c
LOCAL_MODULE := tinycap
LOCAL_SHARED_LIBRARIES:= libcutils libutils libtinyalsa
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= tinymix.c
LOCAL_MODULE := tinymix
LOCAL_SHARED_LIBRARIES:= libcutils libutils libtinyalsa
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= tinypcminfo.c
LOCAL_MODULE := tinypcminfo
LOCAL_SHARED_LIBRARIES:= libcutils libutils libtinyalsa
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Werror
include $(BUILD_EXECUTABLE)
