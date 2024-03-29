# Copyright (C) 2009 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/samsung/transform/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_ARCH_VARIANT_CPU := arm1176jzf-s

TARGET_NO_RECOVERY := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true

BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00280000)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00500000)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x07500000)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x04ac0000)
# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_FFORMAT := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true

USE_CAMERA_STUB := false

TARGET_BOOTLOADER_BOARD_NAME := SPH-M920
TARGET_BOARD_PLATFORM := s3c6410

BOARD_USES_GENERIC_AUDIO := false

BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := eth0
WIFI_DRIVER_MODULE_PATH     := "/system/libmodules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/bcm4329_sta.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/bcm4329_aps.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcm4329_mfg.bin nvram_path=/system/etc/wifi/nvram_mfg.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"

BOARD_HAVE_BLUETOOTH     := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_FM_RADIO      := true

# vflashbird's camcoder fix
BUILD_PV_VIDEO_ENCODERS := 1
