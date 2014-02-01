LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := notbit_jni
LOCAL_SRC_FILES := notbit_jni.c

include $(BUILD_SHARED_LIBRARY)
