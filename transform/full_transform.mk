# Inherit AOSP device configuration for passion.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/transform/prelink-linux-arm-transform.map

DEVICE_PACKAGE_OVERLAYS += device/samsung/transform/overlay

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-http=false \
    ro.sf.lcd_density=120 \
    ro.opengles.version=131072

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml 

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/transform/media_profiles.xml:system/etc/media_profiles.xml

#
# Copy transform specific prebuilt files
#

#
# Wifi
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/wifi/libwlandut.so:system/lib/libwlandut.so \
    device/samsung/transform/prebuilt/transform/wifi/libwlservice.so:system/lib/libwlservice.so \
    device/samsung/transform/prebuilt/transform/wifi/libwpa_client.so:system/lib/libwpa_client.so \
    device/samsung/transform/prebuilt/transform/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    device/samsung/transform/prebuilt/transform/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
    device/samsung/transform/prebuilt/transform/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
    device/samsung/transform/prebuilt/transform/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/samsung/transform/prebuilt/transform/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
    device/samsung/transform/prebuilt/transform/wifi/wifi.conf:system/etc/wifi/wifi.conf \
    device/samsung/transform/prebuilt/transform/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/transform/prebuilt/transform/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/transform/prebuilt/transform/wifi/wlservice:system/bin/wlservice \
    device/samsung/transform/prebuilt/transform/wifi/wpa_supplicant:system/bin/wpa_supplicant \
    device/samsung/transform/prebuilt/transform/wifi/dhd.ko:system/libmodules/dhd.ko

#
# Display (2D)
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/gralloc-libs/libs3c2drender.so:system/lib/libs3c2drender.so \
    device/samsung/transform/prebuilt/transform/gralloc-libs/libs263domxoc.so:system/lib/libs263domxoc.so \
    device/samsung/transform/prebuilt/transform/gralloc-libs/libs263eomxoc.so:system/lib/libs263eomxoc.so \
    device/samsung/transform/prebuilt/transform/gralloc-libs/libs264domxoc.so:system/lib/libs264domxoc.so \
    device/samsung/transform/prebuilt/transform/gralloc-libs/libsavscmn.so:system/lib/libsavscmn.so

#
# Display (3D)
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/fimg-libs/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/transform/prebuilt/transform/fimg-libs/libChunkAlloc.so:system/lib/libChunkAlloc.so \
    device/samsung/transform/prebuilt/transform/fimg-libs/libEGL_fimg.so:system/lib/egl/libEGL_fimg.so \
    device/samsung/transform/prebuilt/transform/fimg-libs/libGLESv1_CM_fimg.so:system/lib/egl/libGLESv1_CM_fimg.so \
    device/samsung/transform/prebuilt/transform/fimg-libs/libGLESv2_fimg.so:system/lib/egl/libGLESv2_fimg.so

#
# GPS config & application from sucka
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/gps/gps.conf:system/etc/gps.conf \
    device/samsung/transform/prebuilt/transform/gps/LBSModeApp.apk:system/app/LBSModeApp.apk \
    device/samsung/transform/prebuilt/transform/gps/libsecgps.so:system/lib/libsecgps.so \
    device/samsung/transform/prebuilt/transform/gps/libsecril-client.so:system/lib/libsecril-client.so

#
# Keys
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/keys/s3c-keypad-rev0050.kl:system/usr/keylayout/s3c-keypad-rev0050.kl \
    device/samsung/transform/prebuilt/transform/keys/sec_headset.kl:system/usr/keylayout/sec_headset.kl \
    device/samsung/transform/prebuilt/transform/keys/s3c-keypad-rev0050.kcm.bin:system/usr/keylayout/melfas_ts_input.kl \
    device/samsung/transform/prebuilt/transform/keys/s3c-keypad-rev0050.kcm.bin:system/usr/keychars/s3c-keypad-rev0050.kcm.bin \
    device/samsung/transform/prebuilt/transform/keys/s3c-keypad-rev0050.kcm.bin:system/usr/keychars/optjoy_device.kcm.bin \
    device/samsung/transform/prebuilt/transform/keys/s3c-keypad-rev0050.kcm.bin:system/usr/keychars/melfas_ts_input.kcm.bin
#
# hw
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/hw/copybit.SPH-M920.so:system/lib/hw/copybit.SPH-M920.so \
    device/samsung/transform/prebuilt/transform/hw/gralloc.SPH-M920.so:system/lib/hw/gralloc.SPH-M920.so \
    device/samsung/transform/prebuilt/transform/hw/lights.SPH-M920.so:system/lib/hw/lights.SPH-M920.so \
    device/samsung/transform/prebuilt/transform/hw/sensors.SPH-M920.so:system/lib/hw/sensors.SPH-M920.so

#
# akm daemon
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/akmd/akmd2:system/bin/akmd2

#
# Vold
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/vold/vold.fstab:system/etc/vold.fstab \
    device/samsung/transform/prebuilt/transform/vold/vold.conf:system/etc/vold.conf

#
# RIL
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/ril/rilclient-test:system/bin/rilclient-test \
    device/samsung/transform/prebuilt/transform/ril/rild:system/bin/rild \
    device/samsung/transform/prebuilt/transform/ril/libsec-ril40.so:system/lib/libsec-ril40.so \

#
# CDMA data
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/data/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/transform/prebuilt/transform/data/pppd:system/bin/pppd \
    device/samsung/transform/prebuilt/transform/data/pppd_runner:system/bin/pppd_runner \
    device/samsung/transform/prebuilt/transform/data/cdma-carriers-conf.xml:system/etc/cdma-carriers-conf.xml \
    device/samsung/transform/prebuilt/transform/data/chap-secrets:system/etc/ppp/chap-secrets \
    device/samsung/transform/prebuilt/transform/data/init.cdma-pppd:system/etc/init.cdma-pppd \
    device/samsung/transform/prebuilt/transform/data/init.gprs-pppd:system/etc/init.gprs-pppd \
    device/samsung/transform/prebuilt/transform/data/ip-down:system/etc/ppp/ip-down \
    device/samsung/transform/prebuilt/transform/data/ip-up:system/etc/ppp/ip-up \
    device/samsung/transform/prebuilt/transform/data/ip-up-vpn:system/etc/ppp/ip-up-vpn \
    device/samsung/transform/prebuilt/transform/data/options:system/etc/ppp/options \
    device/samsung/transform/prebuilt/transform/data/pap-secrets:system/etc/ppp/pap-secrets

#
# Audio
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/audio/asound.conf:system/etc/asound.conf \
    device/samsung/transform/prebuilt/transform/audio/aeqcoe.txt:system/etc/audio/aeqcoe.txt \
    device/samsung/transform/prebuilt/transform/audio/eqfilter.txt:system/etc/audio/eqfilter.txt \
    device/samsung/transform/prebuilt/transform/audio/lmfilter.txt:system/etc/audio/lmfilter.txt \
    device/samsung/transform/prebuilt/transform/audio/situation.txt:system/etc/audio/situation.txt \
    device/samsung/transform/prebuilt/transform/audio/soundbooster.txt:system/etc/audio/soundbooster.txt \
    device/samsung/transform/prebuilt/transform/audio/stream_earpiece.txt:system/etc/audio/stream_earpiece.txt \
    device/samsung/transform/prebuilt/transform/audio/stream_headset.txt:system/etc/audio/stream_headset.txt

#
# serviceModeApp
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/servicemodeapp/serviceModeApp.apk:system/app/serviceModeApp.apk

#
# Bluetooth
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/bt/BCM4329B1_002.002.023.0417.0448.hcd:system/bin/BCM4329B1_002.002.023.0417.0448.hcd \
    device/samsung/transform/prebuilt/transform/bt/bluetoothd:system/bin/bluetoothd \
    device/samsung/transform/prebuilt/transform/bt/btld:system/bin/btld

#
# misc
#
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/transform/misc/iqmsd:system/bin/iqmsd \
    device/samsung/transform/prebuilt/transform/misc/mfgloader:system/bin/mfgloader \
    device/samsung/transform/prebuilt/transform/misc/playlogo:system/bin/playlogo \
    device/samsung/transform/prebuilt/transform/misc/libril.so:system/lib/libril.so \
    device/samsung/transform/prebuilt/transform/misc/libs3c2drender.so:system/lib/libs3c2drender.so \
    device/samsung/transform/prebuilt/transform/misc/libsaacdomxoc.so:system/lib/libsaacdomxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libsac3domxoc.so:system/lib/libsac3domxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libsamrdomxoc.so:system/lib/libsamrdomxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libsamreomxoc.so:system/lib/libsamreomxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libSamsungAFConverter.so:system/lib/libSamsungAFConverter.so \
    device/samsung/transform/prebuilt/transform/misc/libsamsunglmeq.so:system/lib/libsamsunglmeq.so \
    device/samsung/transform/prebuilt/transform/misc/libsamsungr2vs.so:system/lib/libsamsungr2vs.so \
    device/samsung/transform/prebuilt/transform/misc/lib_Samsung_Resampler.so:system/lib/lib_Samsung_Resampler.so \
    device/samsung/transform/prebuilt/transform/misc/libsavidocn.so:system/lib/libsavidocn.so \
    device/samsung/transform/prebuilt/transform/misc/libsavidreg.so:system/lib/libsavidreg.so \
    device/samsung/transform/prebuilt/transform/misc/libsmp3domxoc.so:system/lib/libsmp3domxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libsmp4fmocn.so:system/lib/libsmp4fmocn.so \
    device/samsung/transform/prebuilt/transform/misc/libsmp4vdomxoc.so:system/lib/libsmp4vdomxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libsmp4veomxoc.so:system/lib/libsmp4veomxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libsrec_jni.so:system/lib/libsrec_jni.so \
    device/samsung/transform/prebuilt/transform/misc/libsvc1domxoc.so:system/lib/libsvc1domxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libsvidmiooc.so:system/lib/libsvidmiooc.so \
    device/samsung/transform/prebuilt/transform/misc/libswmadomxoc.so:system/lib/libswmadomxoc.so \
    device/samsung/transform/prebuilt/transform/misc/libswmfdocn.so:system/lib/libswmfdocn.so \
    device/samsung/transform/prebuilt/transform/misc/libswmfdreg.so:system/lib/libswmfdreg.so

#
# Setup device specific product configuration.
#
PRODUCT_NAME := full_transform
PRODUCT_DEVICE := SPH-M920
PRODUCT_MODEL := SPH-M920
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
