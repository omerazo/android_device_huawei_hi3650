#
# Copyright (C) 2016 Jonathan Jason Dennis (theonejohnnyd@gmail.com)
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

TARGET_SPECIFIC_HEADER_PATH := device/huawei/hi6250/include
TARGET_OTA_ASSERT_DEVICE := hi2650,VNS

# Board
TARGET_BOOTLOADER_BOARD_NAME := hisi
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform 
TARGET_BOARD_PLATFORM := hi6250
TARGET_CPU_SMP := true
TARGET_USES_64_BIT_BINDER := true
TARGET_USES_HISI_DTIMAGE := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true
ANDROID_64=true

# 1st Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_ABI := arm64-v8a
TARGET_BOARD_GPU := mali-t830mp2

#2nd Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2576980377
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11166914969
BOARD_FLASH_BLOCK_SIZE := 131072

# Kernel
TARGET_KERNEL_CONFIG := merge_hi6250_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/hi6250
BOARD_KERNEL_CMDLINE := loglevel=4 coherent_pool=512K mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p6(modemnvm_factory),p10(modemnvm_backup),p11(modemnvm_img),p12(modemnvm_system),p18(modem_om),p21(modemnvm_update),p31(modem_fw) no_console_suspend androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00478000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07588000
HISI_TARGET_PRODUCT := hi6250
TARGET_ARM_TYPE := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/huawei/hi6250

# Graphics
USE_OPENGL_RENDERER := true
TARGET_HARDWARE_3D := true
BOARD_EGL_CFG := device/huawei/hi6250/egl.cfg

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Screen
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Audio
BOARD_USES_ALSA_AUDIO := true

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery
TARGET_RECOVERY_FSTAB := device/huawei/hi6250/rootdir/fstab.hi6250
