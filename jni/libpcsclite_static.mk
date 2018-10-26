# Copyright (C) 2010  Free Software Foundation, Inc.
# This Android.mk is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

LOCAL_PATH := $(call my-dir)

# libpcsclite_static

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
LOCAL_MODULE := libpcsclite_static
LOCAL_MODULE_TAGS := eng
LOCAL_EXPORT_C_INCLUDES := $(LIBPCSCLITE_ROOT_ABS)/src/PCSC

include $(BUILD_STATIC_LIBRARY)
