#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#

LOCAL_PATH := device/oplus/ossi

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Enable project quotas and casefolding for emulated storage without sdcardfs - SDCard replacement functionality
#$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    odm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client

PRODUCT_PACKAGES += \
    bootctrl.$(TARGET_BOARD_PLATFORM) \
    bootctrl.$(TARGET_BOARD_PLATFORM).recovery

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libkeymaster41 \
    libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# MTK PlPath Utils
PRODUCT_PACKAGES += \
        mtk_plpath_utils \
        mtk_plpath_utils.recovery

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    libhealthd.$(TARGET_BOARD_PLATFORM)

# libion & libxml2
# VNDK-SP libion from vendor - Memory Allocator functions for ion - Library for interfacing with the ION driver
# The libxml2 package contains libraries and utilities used for parsing XML files.

TARGET_RECOVERY_DEVICE_MODULES += libion
#    libxml2

RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so
#    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so


# Keystore
#PRODUCT_PACKAGES += \
#    android.system.keystore2

# Keymint
#PRODUCT_PACKAGES += \
#    android.hardware.security.keymint \
#    android.hardware.security.secureclock \
#    android.hardware.security.sharedsecret

# Drm
#PRODUCT_PACKAGES += \
#    android.hardware.drm@1.4

# Keymaster
#PRODUCT_PACKAGES += \
#    android.hardware.keymaster@4.1

# Additional target Libraries
#TARGET_RECOVERY_DEVICE_MODULES += \
#    android.hardware.keymaster@4.1

#TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
#    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1.so
