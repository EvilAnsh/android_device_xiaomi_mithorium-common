#
# Copyright (C) 2017-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Userspace Reboot
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Kernel
TARGET_KERNEL_VERSION ?= 4.9

# Platform
TARGET_BOARD_PLATFORM ?= msm8937

ifeq ($(TARGET_BOARD_PLATFORM),msm8953)
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.activity_recognition=msm8937 \
    ro.hardware.sound_trigger=msm8937 \
    vendor.opengles.version=196610
endif

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)/overlay/packages/apps/CarrierConfig

# APEX
OVERRIDE_PRODUCT_COMPRESSED_APEX := false

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG ?= xhdpi

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml

ifneq ($(TARGET_HAS_NO_CONSUMERIR),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml
endif

# ANT
MITHORIUM_PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant@1.0.vendor \
    com.dsi.ant.antradio_library

# Audio
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.soundtrigger@2.1-impl

MITHORIUM_PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.primary.$(TARGET_BOARD_PLATFORM) \
    audio.r_submix.default \
    audio.usb.default

MITHORIUM_PRODUCT_PACKAGES += \
    libaudiopreprocessing \
    libaudioroute \
    libaacwrapper \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle \
    libvolumelistener \
    libtinycompress

MITHORIUM_PRODUCT_PACKAGES += \
    liba2dpoffload \
    libbatterylistener \
    libcirrusspkrprot \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libsndmonitor \
    libspkrprot

# Audio configuration
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc) \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

ifeq ($(TARGET_KERNEL_VERSION),4.9)
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor
else ifeq ($(TARGET_KERNEL_VERSION),4.19)
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor
endif

# Camera
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service

MITHORIUM_PRODUCT_PACKAGES += \
    libstdc++.vendor

MITHORIUM_PRODUCT_PACKAGES += \
    Snap

PRODUCT_PACKAGES += \
    camera.$(TARGET_BOARD_PLATFORM) \
    libmm-qcamera

# Configstore
ifeq ($(TARGET_KERNEL_VERSION),4.19)
MITHORIUM_PRODUCT_PACKAGES += \
    disable_configstore
endif

# Consumer IR
ifneq ($(TARGET_HAS_NO_CONSUMERIR),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service
endif

# Device-specific Settings
MITHORIUM_PRODUCT_PACKAGES += \
    XiaomiParts

# Display
ifeq ($(TARGET_KERNEL_VERSION),4.19)
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.1.vendor \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display
else
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl-2.1
endif

MITHORIUM_PRODUCT_PACKAGES += \
    gralloc.$(TARGET_BOARD_PLATFORM)

MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service \
    hwcomposer.$(TARGET_BOARD_PLATFORM)

MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.$(TARGET_BOARD_PLATFORM)

MITHORIUM_PRODUCT_PACKAGES += \
    libdisplayconfig \
    libgralloc.qti \
    libqdMetaData \
    libtinyxml \
    vendor.display.config@1.11.vendor \
    vendor.display.config@2.0.vendor

# DRM
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.drm@1.3-service.clearkey

# Fastbootd
MITHORIUM_PRODUCT_PACKAGES += \
    fastbootd

# FM
MITHORIUM_PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Gatekeeper HAL
ifneq ($(TARGET_USES_DEVICE_SPECIFIC_GATEKEEPER),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service
endif

# GPS / Location
include $(LOCAL_PATH)/gps/gps_vendor_product.mk

# Health
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# HIDL
MITHORIUM_PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0

MITHORIUM_PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# IMS
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.camera.device@3.3 \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.device@3.5 \
    android.hardware.camera.provider@2.4 \
    android.hardware.camera.provider@2.5 \
    android.hardware.camera.provider@2.6 \
    vendor.qti.hardware.camera.device@1.0

# HW crypto
ifneq ($(TARGET_EXCLUDE_CRYPTFSHW),true)
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee
endif

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/)

# IPACM
MITHORIUM_PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# Keymaster HAL
ifneq ($(TARGET_USES_DEVICE_SPECIFIC_KEYMASTER),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service
endif

# Lights
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.lights-service.xiaomi_mithorium

# LiveDisplay
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# Media
ifeq ($(TARGET_BOARD_PLATFORM),msm8953)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/msm8953/media_profiles_8953.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/msm8953/media_profiles_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8953.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_8953.xml \
    $(LOCAL_PATH)/media/msm8953/media_profiles_8953_v1.xml:system/etc/media_profiles_8953_v1.xml \
    $(LOCAL_PATH)/media/msm8953/media_profiles_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_8953_v1.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_performance_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/msm8937/media_profiles_8937.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/msm8937/media_profiles_8937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/media/msm8937/media_profiles_8956.xml:system/etc/media_profiles_8956.xml \
    $(LOCAL_PATH)/media/msm8937/media_profiles_8956.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_8956.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_8937_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8937_v1.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_8956.xml::$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8956.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_performance_8937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml

MITHORIUM_PRODUCT_PACKAGES += libavservices_minijail.vendor

# MSM IRQ Balancer
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# OMX
MITHORIUM_PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Perf
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.2 \
    vendor.qti.hardware.perf@2.2.vendor

# Power
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint/system/powerhint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/powerhint.xml \
    $(LOCAL_PATH)/configs/powerhint/vendor/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# QMI
MITHORIUM_PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Ramdisk
MITHORIUM_PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    init.xiaomi.rc \
    ueventd.qcom.rc

MITHORIUM_PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.qseecomd.sh

PRODUCT_PACKAGES += \
    fstab.qcom

ifeq ($(TARGET_KERNEL_VERSION),4.19)
MITHORIUM_PRODUCT_PACKAGES += \
    init.qti.dcvs.sh
endif

# RenderScript
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# RIL
MITHORIUM_PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2

# Sensors
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
MITHORIUM_PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Thermal
ifneq ($(TARGET_KERNEL_VERSION),4.19)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti.xiaomi_mithorium
endif

# Trust HAL
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# USB HAL
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Tethering
MITHORIUM_PRODUCT_PACKAGES += \
    TetheringConfigOverlay

# Vibrator
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# Whitelisted app
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/telephony_product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/telephony_product_privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/telephony_system-ext_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/telephony_system-ext_privapp-permissions-qti.xml

# Wifi
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libcld80211 \
    libwifi-hal-ctrl \
    libwpa_client \
    hostapd \
    wificond \
    WifiOverlay \
    wpa_supplicant \
    wpa_supplicant.conf

ifeq ($(TARGET_BOARD_PLATFORM),msm8953)
MITHORIUM_PRODUCT_PACKAGES += WifiOverlay_5GHz
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg_$(TARGET_BOARD_PLATFORM).ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# Build MITHORIUM_PRODUCT_PACKAGES
PRODUCT_PACKAGES += $(MITHORIUM_PRODUCT_PACKAGES)

# Inherit MiThorium QCOM HALs
ifeq ($(TARGET_KERNEL_VERSION),4.9)
$(call inherit-product-if-exists, hardware/mithorium-4.9/mithorium_qcom_hals.mk)
else ifeq ($(TARGET_KERNEL_VERSION),4.19)
$(call inherit-product, hardware/mithorium-4.19/mithorium_qcom_hals.mk)
endif

# Inherit the proprietary files
ifeq ($(TARGET_KERNEL_VERSION),4.9)
$(call inherit-product, vendor/xiaomi/mithorium-common/mithorium-common-vendor.mk)
else ifeq ($(TARGET_KERNEL_VERSION),4.19)
$(call inherit-product, vendor/xiaomi/mithorium-common-4.19/mithorium-common-4.19-vendor.mk)
endif

# Extra
EXTRA_DEVICE_BRACKET := low-end
