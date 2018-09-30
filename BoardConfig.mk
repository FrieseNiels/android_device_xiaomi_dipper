#
# Copyright 2018 The Android Open Source Project
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

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xA84000 androidboot.hardware=qcom androidboot.console=ttyMSM0 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
NEED_KERNEL_MODULE_SYSTEM := true
TARGET_KERNEL_ARCH := arm64

# Enable 64-bits binder
TARGET_USES_64_BIT_BINDER := true

# VNDK
BOARD_VNDK_VERSION := current

# Properties
TARGET_SYSTEM_PROP := build/make/target/board/treble_system.prop
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57453555712

BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
TARGET_USES_MKE2FS := true

# Generic AOSP image always requires separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor

# Android generic system image always create metadata partition
BOARD_USES_METADATA_PARTITION := true

# Generic AOSP image does NOT support HWC1
TARGET_USES_HWC2 := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Recovery
TARGET_RECOVERY_FSTAB := device/xiaomi/dipper/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# NFC
TARGET_USES_NQ_NFC := false

# Set emulator framebuffer display device buffer count to 3
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# VBMETA should be never used in Treble GSI
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Dipper properties
TARGET_SYSTEM_PROP := device/xiaomi/dipper/system.prop $(TARGET_SYSTEM_PROP)

# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/xiaomi/dipper/sepolicy/private

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/qcom/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += device/qcom/sepolicy/public

# bdroid configuration
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/dipper/bluetooth

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Filesystem
TARGET_FS_CONFIG_GEN := device/xiaomi/dipper/config.fs

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2
TARGET_USES_HWC2 := true

TARGET_EXFAT_DRIVER := exfat

#SELINUX_IGNORE_NEVERALLOWS := true

