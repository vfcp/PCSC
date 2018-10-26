# Copyright (C) 2010  Free Software Foundation, Inc.
# This Android.mk is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

LOCAL_PATH := $(call my-dir)

LIBUSB_PATH := $(LOCAL_PATH)/../../libusb
LIBCCID_PATH := $(LOCAL_PATH)/../../CCID

# libusb1.0
include $(CLEAR_VARS)
LOCAL_MODULE := libusb1.0
LOCAL_SRC_FILES := $(LIBUSB_PATH)/android/libs/$(TARGET_ARCH_ABI)/libusb1.0.so
LOCAL_EXPORT_C_INCLUDES := $(LIBUSB_PATH)/libusb
include $(PREBUILT_SHARED_LIBRARY)

# libccid
include $(CLEAR_VARS)
LOCAL_MODULE := libccid
LOCAL_SRC_FILES := $(LIBCCID_PATH)/libs/$(TARGET_ARCH_ABI)/libccid.so
LOCAL_EXPORT_C_INCLUDES := $(LIBCCID_PATH)
include $(PREBUILT_SHARED_LIBRARY)

include $(LOCAL_PATH)/libpcsclite.mk
include $(LOCAL_PATH)/libpcsclite_static.mk
include $(LOCAL_PATH)/pcscd.mk
