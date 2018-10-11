#
# Copyright 2017-2018 Phh-Treble
# Copyright 2018 Google Pixel2ROM Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#Huawei devices don't declare fingerprint and telephony hardware feature
#TODO: Proper detection
PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/xiaomi/dipper/sepolicy
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/dipper/overlay

#USB Audio
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

PRODUCT_PACKAGES += \
	treble-environ-rc

PRODUCT_PACKAGES += \
	bootctl \
	vintf

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	tinymix

# Vulkan driver
PRODUCT_PACKAGES += \
    libvulkan

# Lights
PRODUCT_PACKAGES += \
	android.hardware.light@2.0-service.xiaomi_sdm845

# Power
PRODUCT_PACKAGES += \
	power.qcom

# Bluetooth configuration
PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	device/xiaomi/dipper/bt_profile.conf:system/etc/bluetooth/bt_profile.conf \
	device/xiaomi/dipper/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
	device/xiaomi/dipper/internal_iot_devlist.conf:system/etc/bluetooth/internal_iot_devlist.conf \
	device/xiaomi/dipper/interop_database.conf:system/etc/bluetooth/interop_database.conf

# Audio policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# Common init scripts
PRODUCT_PACKAGES += \
	init.qcom.rc

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:system/etc/manifest.xml

PRODUCT_PACKAGES += \
	android.hidl.base@1.0 \
	android.hidl.manager@1.0

# Recovery init scripts
PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
	device/xiaomi/dipper/init.recovery.hardware.rc:root/init.recovery.hardware.rc

# RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

# NFC
$(call inherit-product, device/xiaomi/dipper/device-nfc.mk)

# SIM
PRODUCT_PACKAGES += Stk

# caf telephony
PRODUCT_PACKAGES += telephony-ext

# caf ims
PRODUCT_PACKAGES += ims-ext-common

# TextClassifier
PRODUCT_PACKAGES += textclassifier.bundle1

# AID/fs configs
PRODUCT_PACKAGES += fs_config_files

ifneq (,$(wildcard external/exfat))
PRODUCT_PACKAGES += \
	mkfs.exfat \
	fsck.exfat
endif

PRODUCT_PACKAGES += \
	android.hardware.wifi.hostapd-V1.0-java \
	vendor.qti.hardware.radio.am-V1.0-java \
	vendor.qti.qcril.am-V1.0-java \

PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/interfaces.xml:system/etc/permissions/interfaces.xml

# Define DPI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420

# Fingerprint navigation
PRODUCT_COPY_FILES += \
        device/xiaomi/dipper/uinput-goodix.idc:system/usr/idc/uinput-goodix.idc \
        device/xiaomi/dipper/uinput-goodix.kl:system/usr/keylayout/uinput-goodix.kl

# Audio configs
PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/audio_effects.conf:system/etc/audio_effects.conf

# Treble GSI (import from build/target/product/treble_common.mk)

# Split selinux policy
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Name space configuration file for non-enforcing VNDK
PRODUCT_PACKAGES += \
    ld.config.vndk_lite.txt

# TODO(b/78308559): includes vr_hwc into GSI before vr_hwc move to vendor
PRODUCT_PACKAGES += \
    vr_hwc

# Offmode charging
PRODUCT_PACKAGES += \
    chargeonlymode

# ADB
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.selinux=0

# SPN
PRODUCT_COPY_FILES += device/xiaomi/dipper/spn-conf.xml:system/etc/spn-conf.xml

# Kernel
$(call inherit-product, device/xiaomi/dipper-kernel/device-kernel.mk)

