LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := notbit
LOCAL_SRC_FILES := prebuild/$(TARGET_ARCH_ABI)/libnotbit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := crypto
LOCAL_SRC_FILES := prebuild/$(TARGET_ARCH_ABI)/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)


include $(CLEAR_VARS)
NDK_TOOLCHAIN_VERSION := 4.8
LOCAL_MODULE    := notbit_jni
LOCAL_SRC_FILES := notbit_jni.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../extern/local_notbit/
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../extern/local_notbit/src/
LOCAL_STATIC_LIBRARIES := notbit crypto
include $(BUILD_SHARED_LIBRARY)
