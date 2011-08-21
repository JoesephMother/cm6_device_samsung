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
    Stk \
    Superuser

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
PRODUCT_PACKAGE_OVERLAYS += vendor/intercept/overlay/intercept

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    device/samsung/intercept/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    device/samsung/intercept/prebuilt/common/bin/remount:system/bin/remount \
    device/samsung/intercept/prebuilt/common/bin/compcache:system/bin/compcache \
    device/samsung/intercept/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    device/samsung/intercept/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    device/samsung/intercept/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    device/samsung/intercept/prebuilt/common/etc/init.d/04apps2sd:system/etc/init.d/04apps2sd \
    device/samsung/intercept/prebuilt/common/etc/init.d/05apps2sdoff:system/etc/init.d/05apps2sdoff \
    device/samsung/intercept/prebuilt/common/etc/init.d/07userinit:system/etc/init.d/07userinit \
    device/samsung/intercept/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    device/samsung/intercept/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    device/samsung/intercept/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    device/samsung/intercept/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    device/samsung/intercept/prebuilt/common/etc/profile:system/etc/profile \
    device/samsung/intercept/prebuilt/common/xbin/bash:system/xbin/bash \
    device/samsung/intercept/prebuilt/common/xbin/htop:system/xbin/htop \
    device/samsung/intercept/prebuilt/common/xbin/lsof:system/xbin/lsof \
    device/samsung/intercept/prebuilt/common/xbin/nano:system/xbin/nano \
    device/samsung/intercept/prebuilt/common/xbin/powertop:system/xbin/powertop \
    device/samsung/intercept/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

intercept_WITH_GOOGLE:=true
# I'll always build with gapps :)
ifdef intercept_WITH_GOOGLE

    PRODUCT_COPY_FILES += \
	vendor/intercept/proprietary/CarHomeGoogle.apk:system/app/CarHomeGoogle.apk \
	vendor/intercept/proprietary/CarHomeLauncher.apk:system/app/CarHomeLauncher.apk \
	vendor/intercept/proprietary/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
	vendor/intercept/proprietary/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
	vendor/intercept/proprietary/Facebook.apk:system/app/Facebook.apk \
	vendor/intercept/proprietary/features.xml:system/etc/permissions/features.xml \
	vendor/intercept/proprietary/GenieWidget.apk:system/app/GenieWidget.apk \
	vendor/intercept/proprietary/Gmail.apk:system/app/Gmail.apk \
	vendor/intercept/proprietary/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
	vendor/intercept/proprietary/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
	vendor/intercept/proprietary/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
	vendor/intercept/proprietary/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
	vendor/intercept/proprietary/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
	vendor/intercept/proprietary/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
	vendor/intercept/proprietary/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
	vendor/intercept/proprietary/googlevoice.apk:system/app/googlevoice.apk \
	vendor/intercept/proprietary/HtcCopyright.apk:system/app/HtcCopyright.apk \
	vendor/intercept/proprietary/HtcEmailPolicy.apk:system/app/HtcEmailPolicy.apk \
	vendor/intercept/proprietary/HtcSettings.apk:system/app/HtcSettings.apk \
	vendor/intercept/proprietary/LatinImeTutorial.apk:system/app/LatinImeTutorial.apk \
	vendor/intercept/proprietary/libinterstitial.so:system/lib/libinterstitial.so \
	vendor/intercept/proprietary/libspeech.so:system/lib/libspeech.so \
	vendor/intercept/proprietary/libvoicesearch.so:system/lib/libvoicesearch.so \
	vendor/intercept/proprietary/Maps.apk:system/app/Maps.apk \
	vendor/intercept/proprietary/MarketUpdater.apk:system/app/MarketUpdater.apk \
	vendor/intercept/proprietary/MediaUploader.apk:system/app/MediaUploader.apk \
	vendor/intercept/proprietary/NetworkLocation.apk:system/app/NetworkLocation.apk \
	vendor/intercept/proprietary/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
	vendor/intercept/proprietary/SetupWizard.apk:system/app/SetupWizard.apk \
	vendor/intercept/proprietary/Talk.apk:system/app/Talk.apk \
	vendor/intercept/proprietary/Twitter.apk:system/app/Twitter.apk \
	vendor/intercept/proprietary/Vending.apk:system/app/Vending.apk \
	vendor/intercept/proprietary/VoiceSearch.apk:system/app/VoiceSearch.apk \
	vendor/intercept/proprietary/YouTube.apk:system/app/YouTube.apk
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
	vendor/intercept/CHANGELOG:system/etc/CHANGELOG.txt

PRODUCT_COPY_FILES += \
	vendor/cyanogen/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

#
# Copy bootanimation
#
PRODUCT_COPY_FILES += \
	device/samsung/intercept/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
