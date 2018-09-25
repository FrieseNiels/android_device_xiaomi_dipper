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

# Kernel image
ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/xiaomi/dipper-kernel/Image.gz-dtb
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel

#Use a more decent APN config
PRODUCT_COPY_FILES += \
	device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

#Huawei devices don't declare fingerprint and telephony hardware feature
#TODO: Proper detection
PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

#Use a more decent APN config
PRODUCT_COPY_FILES += \
	device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/xiaomi/dipper/sepolicy
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/dipper/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

#Those overrides are here because Huawei's init read properties
#from /system/etc/prop.default, then /vendor/build.prop, then /system/build.prop
#So we need to set our props in prop.default
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
	ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
	ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
	ro.build.version.release=$(PLATFORM_VERSION) \
	ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH) \
	ro.adb.secure=0

#Huawei HiSuite (also other OEM custom programs I guess) it's of no use in AOSP builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	persist.sys.usb.config=adb

#VNDK config files
PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/vndk-detect:system/bin/vndk-detect \
	device/xiaomi/dipper/vndk.rc:system/etc/init/vndk.rc

#USB Audio
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/rw-system.sh:system/bin/rw-system.sh \
	device/xiaomi/dipper/fixSPL/getSPL.arm:system/bin/getSPL

PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/empty:system/phh/empty \
	device/xiaomi/dipper/phh-on-boot.sh:system/bin/phh-on-boot.sh

PRODUCT_PACKAGES += \
	treble-environ-rc

PRODUCT_PACKAGES += \
	bootctl \
	vintf

# NFC
PRODUCT_PACKAGES += \
	NfcNci \
	Tag \
	com.android.nfc_extras \
	android.hardware.nfc@1.0 \
	android.hardware.nfc@1.1:64

PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/twrp/twrp.rc:system/etc/init/twrp.rc \
	device/xiaomi/dipper/twrp/twrp.sh:system/bin/twrp.sh \
	device/xiaomi/dipper/twrp/busybox-armv7l:system/bin/busybox_phh

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

# NFC
PRODUCT_COPY_FILES += \
	device/xiaomi/dipper/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

# NQNfcNci
#PRODUCT_PACKAGES += \
#	NQNfcNci \
#	com.nxp.nfc.nq \
#	NfcLinks

#PRODUCT_COPY_FILES += \
#       device/xiaomi/dipper-treble/proprietary/lib64/libnfc_ndef.so:system/lib64/libnfc_ndef.so \
#       device/xiaomi/dipper-treble/proprietary/lib/libnfc_ndef.so:system/lib/libnfc_ndef.so \
#       device/xiaomi/dipper-treble/proprietary/lib64/libnqnfc-nci.so:system/lib64/libnqnfc-nci.so \
#       device/xiaomi/dipper-treble/proprietary/lib64/libnqnfc_nci_jni.so:system/lib64/libnqnfc_nci_jni.so \
#       device/xiaomi/dipper-treble/proprietary/lib64/libnqp61-jcop-kit.so:system/lib64/libnqp61-jcop-kit.so
