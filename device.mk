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

#USB Audio
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

PRODUCT_PACKAGES += \
	treble-environ-rc

PRODUCT_PACKAGES += \
	bootctl \
	vintf

# Lights
PRODUCT_PACKAGES += \
	android.hardware.light@2.0-service.xiaomi_sdm845

# Power
PRODUCT_PACKAGES += \
	power.qcom

# Common init scripts
PRODUCT_PACKAGES += \
	init.qcom.rc

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# NFC
$(call inherit-product, device/xiaomi/dipper/device-nfc.mk)

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
	device/xiaomi/dipper/audio_diag.cfg:system/etc/audio_diag.cfg \
	device/xiaomi/dipper/audio_effects.conf:system/etc/audio_effects.conf \
	device/xiaomi/dipper/audio_policy.conf:system/etc/audio_policy.conf

# Treble GSI (import from build/target/product/treble_common.mk)

# Split selinux policy
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Name space configuration file for non-enforcing VNDK
PRODUCT_PACKAGES += \
    ld.config.vndk_lite.txt

# TODO(b/78308559): includes vr_hwc into GSI before vr_hwc move to vendor
PRODUCT_PACKAGES += \
    vr_hwc
