# Copyright (C) 2014 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Platform
BOARD_VENDOR := htc
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_QCOM_MEDIA_VARIANT := caf-new
TARGET_USES_QCOM_BSP := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := mem

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02008000 --tags_offset 0x01e00000
TARGET_KERNEL_CONFIG := cm_memul_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/mem
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/htc/mem/mkbootimg.mk

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_SEPARATE_SPKR_BACKEND := true
BOARD_AUDIO_AMPLIFIER := device/htc/mem/libaudioamp
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/mem/bluetooth

# Camera
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"htc.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0},'
USE_DEVICE_SPECIFIC_CAMERA := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
BOARD_EGL_CFG := device/htc/mem/configs/egl.cfg
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# RIL
BOARD_PROVIDES_LIBRIL := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"

# cat /proc/emmc
# dev:        size     erasesize name
# mmcblk0p1: 00100000  00000200  "sbl1"
# mmcblk0p2: 02000000  00000200  "pg1fs"
# mmcblk0p3: 00004000  00000200  "board_info"
# mmcblk0p4: 00ef7c00  00000200  "reserve_1"
# mmcblk0p5: 00040000  00000200  "mfg"
# mmcblk0p6: 017afc00  00000200  "pg2fs"
# mmcblk0p7: 00040000  00000200  "sbl1_update"
# mmcblk0p8: 00040000  00000200  "rpm"
# mmcblk0p9: 00200000  00000200  "tz"
# mmcblk0p10: 00008000  00000200  "sdi"
# mmcblk0p11: 00400000  00000200  "hboot"
# mmcblk0p12: 00500000  00000200  "sp1"
# mmcblk0p13: 00100000  00000200  "wifi"
# mmcblk0p14: 00008000  00000200  "ddr"
# mmcblk0p15: 00100000  00000200  "dsps"
# mmcblk0p16: 03c00400  00000200  "adsp"
# mmcblk0p17: 00500000  00000200  "wcnss"
# mmcblk0p18: 00800000  00000200  "radio_config"
# mmcblk0p19: 00180000  00000200  "fsg"
# mmcblk0p20: 04b00400  00000200  "radio"
# mmcblk0p21: 00400000  00000200  "tool_diag"
# mmcblk0p22: 00a00000  00000200  "custdata"
# mmcblk0p23: 006ffc00  00000200  "reserve_2"
# mmcblk0p24: 00100000  00000200  "misc"
# mmcblk0p25: 00180000  00000200  "modem_st1"
# mmcblk0p26: 00180000  00000200  "modem_st2"
# mmcblk0p27: 01400000  00000200  "fataldevlog"
# mmcblk0p28: 00001000  00000200  "debug_config"
# mmcblk0p29: 00040000  00000200  "pdata"
# mmcblk0p30: 00004000  00000200  "control"
# mmcblk0p31: 00140400  00000200  "local"
# mmcblk0p32: 00010000  00000200  "extra"
# mmcblk0p33: 00100000  00000200  "cdma_record"
# mmcblk0p34: 00000400  00000200  "fsc"
# mmcblk0p35: 00002000  00000200  "ssd"
# mmcblk0p36: 00040000  00000200  "skylink"
# mmcblk0p37: 01900000  00000200  "carrier"
# mmcblk0p38: 01e00000  00000200  "devlog"
# mmcblk0p39: 00e28800  00000200  "reserve"
# mmcblk0p40: 01000000  00000200  "boot"
# mmcblk0p41: 01000000  00000200  "recovery"
# mmcblk0p42: 16000000  00000200  "cache"
# mmcblk0p43: a8000000  00000200  "system"
# mmcblk0p44: c8000000  00000200  "userdata"

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2818572288
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3355443200
BOARD_FLASH_BLOCK_SIZE := 131072

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Recovery
TARGET_RECOVERY_FSTAB := device/htc/mem/rootdir/etc/fstab.qcom
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/htc/mem/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file_contexts \
    file.te \
    hci_init.te \
    healthd.te \
    init_shell.te \
    init.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    wpa_socket.te \
    wpa.te

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Flags
COMMON_GLOBAL_CFLAGS += -DHTCLOG

#TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
#TW_INTERNAL_STORAGE_PATH := "/data/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_NO_USB_STORAGE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_INCLUDE_JB_CRYPTO := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_HTC_LED := true

# inherit from the proprietary version
-include vendor/htc/mem/BoardConfigVendor.mk
