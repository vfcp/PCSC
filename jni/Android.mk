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

# libusb
include $(CLEAR_VARS)
LOCAL_MODULE := libusb
LOCAL_SRC_FILES := $(LIBUSB_PATH)/android/libs/$(TARGET_ARCH_ABI)/libusb1.0.so
LOCAL_EXPORT_C_INCLUDES := $(LIBUSB_PATH)/libusb
include $(PREBUILT_SHARED_LIBRARY)

# libccid
include $(CLEAR_VARS)
LOCAL_MODULE := libccid
LOCAL_SRC_FILES := $(LIBCCID_PATH)/libs/$(TARGET_ARCH_ABI)/libccid.so
LOCAL_EXPORT_C_INCLUDES := $(LIBCCID_PATH)
include $(PREBUILT_SHARED_LIBRARY)

# libpcsclite.so

include $(CLEAR_VARS)

LIBPCSCLITE_ROOT_REL := ..
LIBPCSCLITE_ROOT_ABS := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := \
	$(LIBPCSCLITE_ROOT_REL)/src/debug.c \
	$(LIBPCSCLITE_ROOT_REL)/src/error.c \
	$(LIBPCSCLITE_ROOT_REL)/src/simclist.c \
	$(LOCAL_PATH)/strlcat.c \
	$(LIBPCSCLITE_ROOT_REL)/src/strlcpy.c \
	$(LIBPCSCLITE_ROOT_REL)/src/sys_unix.c \
	$(LIBPCSCLITE_ROOT_REL)/src/utils.c \
	$(LIBPCSCLITE_ROOT_REL)/src/winscard_msg.c \
	$(LIBPCSCLITE_ROOT_REL)/src/winscard_clnt.c

LOCAL_CFLAGS := \
	-DANDROID \
	-DDISABLE_SYSTEMD \
	-DPCSCD_PATH='"$(PCSCD_PATH)"' \
	-DHAVE_CONFIG_H \
	-DLIBPCSCLITE

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/.. \
	$(LIBPCSCLITE_ROOT_ABS)/src/PCSC \
	$(LIBPCSCLITE_ROOT_ABS)/src

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libpcsclite
LOCAL_MODULE_TAGS := eng
LOCAL_EXPORT_C_INCLUDES := $(LIBPCSCLITE_ROOT_ABS)/src/PCSC

include $(BUILD_SHARED_LIBRARY)

# pcscd

include $(CLEAR_VARS)

PCSCD_ROOT_REL := ..
PCSCD_ROOT_ABS := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := \
	$(PCSCD_ROOT_REL)/src/auth.c \
	$(PCSCD_ROOT_REL)/src/debuglog.c \
	$(PCSCD_ROOT_REL)/src/atrhandler.c \
	$(LOCAL_PATH)/configfile.c \
	$(PCSCD_ROOT_REL)/src/dyn_hpux.c \
	$(PCSCD_ROOT_REL)/src/dyn_macosx.c \
	$(PCSCD_ROOT_REL)/src/dyn_unix.c \
	$(PCSCD_ROOT_REL)/src/eventhandler.c \
	$(PCSCD_ROOT_REL)/src/hotplug_generic.c \
	$(PCSCD_ROOT_REL)/src/hotplug_libusb.c \
	$(PCSCD_ROOT_REL)/src/hotplug_linux.c \
	$(PCSCD_ROOT_REL)/src/hotplug_macosx.c \
	$(PCSCD_ROOT_REL)/src/ifdwrapper.c \
	$(PCSCD_ROOT_REL)/src/pcscdaemon.c \
	$(PCSCD_ROOT_REL)/src/prothandler.c \
	$(PCSCD_ROOT_REL)/src/readerfactory.c \
	$(PCSCD_ROOT_REL)/src/simclist.c \
	$(LOCAL_PATH)/strlcat.c \
	$(PCSCD_ROOT_REL)/src/strlcpy.c \
	$(PCSCD_ROOT_REL)/src/sys_unix.c \
	$(LOCAL_PATH)/tokenparser.c \
	$(PCSCD_ROOT_REL)/src/utils.c \
	$(PCSCD_ROOT_REL)/src/winscard.c \
	$(PCSCD_ROOT_REL)/src/winscard_msg.c \
	$(PCSCD_ROOT_REL)/src/winscard_msg_srv.c \
	$(PCSCD_ROOT_REL)/src/winscard_svc.c

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/.. \
	$(PCSCD_ROOT_ABS)/src/PCSC \
	$(PCSCD_ROOT_ABS)/src

LOCAL_CFLAGS := \
	-DANDROID \
	-DDISABLE_SYSTEMD \
	-DPCSCD_PATH='"$(PCSCD_PATH)"' \
	-DHAVE_CONFIG_H \
	-DPCSCD \
	-DSIMCLIST_NO_DUMPRESTORE

LOCAL_LDLIBS := -llog -ldl
LOCAL_SHARED_LIBRARIES := libusb libccid
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := pcscd
LOCAL_MODULE_TAGS := eng

include $(BUILD_EXECUTABLE)