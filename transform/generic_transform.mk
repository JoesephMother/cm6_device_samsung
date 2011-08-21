# Generic leshakmod product
PRODUCT_NAME := CyanogenMod
PRODUCT_BRAND := sdx
PRODUCT_DEVICE := generic

# Use edify for otapackage
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_SCRIPT_MODE=amend

# Used by BusyBox
KERNEL_MODULES_DIR:=/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=true \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.heapsize=30m

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# mobile interfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0

#scan interval
PRODUCT_PROPERTY_OVERRIDES += \
wifi.supplicant_scan_interval=180

# Repeat ring tone on incoming calls (CM/Blade)
PRODUCT_PROPERTY_OVERRIDES += \
ro.telephony.call_ring.multiple=false

# OpenVPN
PRODUCT_PACKAGES += \
    openvpn

PRODUCT_PACKAGES += \
    ADWLauncher \
    CMParts \
    CMPartsHelper \
    CMStats \
    CMUpdateNotify \
    CMWallpapers \
    FileManager \
    Stk

ifeq ($(BOARD_HAVE_FM_RADIO),true)
    PRODUCT_PACKAGES += \
    FM
endif

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/transform/overlay/transform

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    device/samsung/transform/prebuilt/common/bin/remount:system/bin/remount \
    device/samsung/transform/prebuilt/common/bin/compcache:system/bin/compcache \
    device/samsung/transform/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    device/samsung/transform/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    device/samsung/transform/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    device/samsung/transform/prebuilt/common/etc/init.d/04apps2sd:system/etc/init.d/04apps2sd \
    device/samsung/transform/prebuilt/common/etc/init.d/05apps2sdoff:system/etc/init.d/05apps2sdoff \
    device/samsung/transform/prebuilt/common/etc/init.d/07userinit:system/etc/init.d/07userinit \
    device/samsung/transform/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    device/samsung/transform/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    device/samsung/transform/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    device/samsung/transform/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    device/samsung/transform/prebuilt/common/etc/profile:system/etc/profile \
    device/samsung/transform/prebuilt/common/xbin/bash:system/xbin/bash \
    device/samsung/transform/prebuilt/common/xbin/htop:system/xbin/htop \
    device/samsung/transform/prebuilt/common/xbin/lsof:system/xbin/lsof \
    device/samsung/transform/prebuilt/common/xbin/nano:system/xbin/nano \
    device/samsung/transform/prebuilt/common/xbin/powertop:system/xbin/powertop \
    device/samsung/transform/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

transform_WITH_GOOGLE:=true
# I'll always build with gapps :)
ifdef transform_WITH_GOOGLE

    PRODUCT_COPY_FILES += \
	vendor/transform/proprietary/CarHomeGoogle.apk:system/app/CarHomeGoogle.apk \
	vendor/transform/proprietary/CarHomeLauncher.apk:system/app/CarHomeLauncher.apk \
	vendor/transform/proprietary/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
	vendor/transform/proprietary/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
	vendor/transform/proprietary/Facebook.apk:system/app/Facebook.apk \
	vendor/transform/proprietary/features.xml:system/etc/permissions/features.xml \
	vendor/transform/proprietary/GenieWidget.apk:system/app/GenieWidget.apk \
	vendor/transform/proprietary/Gmail.apk:system/app/Gmail.apk \
	vendor/transform/proprietary/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
	vendor/transform/proprietary/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
	vendor/transform/proprietary/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
	vendor/transform/proprietary/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
	vendor/transform/proprietary/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
	vendor/transform/proprietary/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
	vendor/transform/proprietary/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
	vendor/transform/proprietary/googlevoice.apk:system/app/googlevoice.apk \
	vendor/transform/proprietary/HtcCopyright.apk:system/app/HtcCopyright.apk \
	vendor/transform/proprietary/HtcEmailPolicy.apk:system/app/HtcEmailPolicy.apk \
	vendor/transform/proprietary/HtcSettings.apk:system/app/HtcSettings.apk \
	vendor/transform/proprietary/LatinImeTutorial.apk:system/app/LatinImeTutorial.apk \
	vendor/transform/proprietary/libinterstitial.so:system/lib/libinterstitial.so \
	vendor/transform/proprietary/libspeech.so:system/lib/libspeech.so \
	vendor/transform/proprietary/libvoicesearch.so:system/lib/libvoicesearch.so \
	vendor/transform/proprietary/Maps.apk:system/app/Maps.apk \
	vendor/transform/proprietary/MarketUpdater.apk:system/app/MarketUpdater.apk \
	vendor/transform/proprietary/MediaUploader.apk:system/app/MediaUploader.apk \
	vendor/transform/proprietary/NetworkLocation.apk:system/app/NetworkLocation.apk \
	vendor/transform/proprietary/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
	vendor/transform/proprietary/SetupWizard.apk:system/app/SetupWizard.apk \
	vendor/transform/proprietary/Talk.apk:system/app/Talk.apk \
	vendor/transform/proprietary/Twitter.apk:system/app/Twitter.apk \
	vendor/transform/proprietary/Vending.apk:system/app/Vending.apk \
	vendor/transform/proprietary/VoiceSearch.apk:system/app/VoiceSearch.apk \
	vendor/transform/proprietary/YouTube.apk:system/app/YouTube.apk
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
	vendor/transform/CHANGELOG:system/etc/CHANGELOG.txt

PRODUCT_COPY_FILES += \
	vendor/cyanogen/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

#
# Copy bootanimation
#
PRODUCT_COPY_FILES += \
	device/samsung/transform/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
