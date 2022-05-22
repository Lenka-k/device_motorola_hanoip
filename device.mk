#
# Copyright (C) 2017-2020 The LineageOS Project
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

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_SHIPPING_API_LEVEL := 30
BOARD_API_LEVEL := 30
PRODUCT_USE_DYNAMIC_PARTITIONS := true

$(call inherit-product, device/motorola/sm6150-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/hanoip/hanoip-vendor.mk)

# Use 6-GB dalvik-heap instead
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Properties
-include $(LOCAL_PATH)/properties.mk
    
# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor
    
PRODUCT_PACKAGES += \
    FrameworksResCommon_Sys \
    CarrierConfigResCommon_Sys \
    CellBroadcastReceiverResCommon_Sys \
    SystemUIResCommon_Sys \
    TelecommResCommon_Sys \
    TelephonyResCommon_Sys \
    WifiResCommon_Sys \
    FrameworksResTarget \
    WifiResTarget

PRODUCT_PACKAGES += \
    FrameworksReshanoip \
    SettingsReshanoip \
    SystemUIReshanoip

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
	NoCutoutOverlay

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml
    
PRODUCT_COPY_FILES += \
    hardware/qcom-caf/sm8150/audio/configs/common/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    hardware/qcom-caf/sm8150/audio/configs/common/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml \
    hardware/qcom-caf/sm8150/audio/configs/common/bluetooth_qti_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_hearing_aid_audio_policy_configuration.xml
    
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml

# Display
PRODUCT_PACKAGES += \
    SettingsOverlayRefreshRate

# Camera
PRODUCT_PACKAGES += \
    libgui_vendor

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Init
PRODUCT_PACKAGES += \
    init.mmi.overlay.rc \
    init.mmi.block_perm.sh \
    init.mmi.charge_only.rc \
    init.qcom.post_boot.sh \
    init.qti.dcvs.sh \
    init.oem.fingerprint.sh \
    init.oem.fingerprint2.sh

# Use the default path if fstab.qcom is available in your device tree, otherwise you need to specify the path to the fstab.qcom
# In my case path is =
# device/motorola/sm6150-common/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_COPY_FILES += \
    device/motorola/sm6150-common/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom
    
# This is the default path to fstab.qcom
#    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom
    
PRODUCT_PACKAGES += \
    disable_configstore
    
# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0.vendor \
    android.hardware.drm@1.1.vendor \
    android.hardware.drm@1.2.vendor \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm@1.4-service.clearkey
    
# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor
    
# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.hanoip
    
# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor \
    libloc_net_iface \
    libloc_net_iface.vendor
    
# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    SecureElement \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal
    
# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.hanoip
    
# Vibrator
$(call inherit-product, vendor/qcom/opensource/vibrator/vibrator-vendor-product.mk)

# vndservicemanager has been removed from API30 devices (aosp/1235751)
# but we still need it for display services.
PRODUCT_PACKAGES += \
    vndservicemanager

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
