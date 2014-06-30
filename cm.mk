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

$(call inherit-product, device/htc/mem/full_mem.mk)

$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_RELEASE_NAME := mem

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/mem/device.mk)

# Device naming
PRODUCT_DEVICE := mem
PRODUCT_NAME := cm_mem
PRODUCT_BRAND := htc
PRODUCT_MODEL := One Mini 2
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mem BUILD_FINGERPRINT="htc/htc_europe/htc_memul:4.4.2/KOT49H/338202.2:user/release-keys" PRIVATE_BUILD_DESC="1.16.401.2 CL338202 release-keys"
