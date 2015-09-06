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

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Audio
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_FM := true

# Bluetooth
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/memul/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# Board
BOARD_USES_QCOM_HARDWARE := true
BOARD_VENDOR := htc
MALLOC_IMPL := dlmalloc
TARGET_BOARD_PLATFORM := msm8226

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := memul
TARGET_NO_BOOTLOADER := true

# Camera
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"htc.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0}, {"persist.camera.", AID_MEDIA, 0},'
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW
BOARD_HARDWARE_CLASS := device/htc/memul/cmhw

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 369098752
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2818572288
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3355443200

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Graphics
BOARD_EGL_CFG := device/htc/memul/configs/egl.cfg
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Includes
TARGET_SPECIFIC_HEADER_PATH := device/htc/memul/include

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/htc/memul/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02008000 --tags_offset 0x01e00000
TARGET_KERNEL_CONFIG := cm_memul_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8974

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Logging
COMMON_GLOBAL_CFLAGS += -DHTCLOG -DMOTOROLA_LOG

# NFC
BOARD_NFC_CHIPSET := pn547

# Power
TARGET_POWERHAL_VARIANT := qcom

# Recovery
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_BLDRMSG_OFFSET := 2048
BOARD_RECOVERY_SWIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_DEVICE_MODULES += chargeled
TARGET_RECOVERY_FSTAB := device/htc/memul/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
# DON'T USE F2FS IF BUILDING ON MAC
ifeq ($(HOST_OS),linux)
TARGET_USERIMAGES_USE_F2FS := true
else
TARGET_USERIMAGES_USE_F2FS := false
endif

# RIL
BOARD_PROVIDES_LIBRIL := true

# SELinux
-include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/htc/memul/sepolicy
BOARD_SEPOLICY_UNION += \
    akmd.te \
    device.te \
    file_contexts \
    file.te \
    init.te \
    kcal_dev.te \
    kernel.te \
    mediaserver.te \
    mm-qcamerad.te \
    mpdecision.te \
    platform_app.te \
    property_contexts \
    recovery.te \
    rmt_storage.te \
    system_server.te \
    thermal-engine.te \
    ueventd.te \
    vibe_dev.te \
    wpa.te \
    vold.te


# Time
BOARD_USES_QC_TIME_SERVICES := true

# Wifi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# inherit from the proprietary version
-include vendor/htc/memul/BoardConfigVendor.mk
