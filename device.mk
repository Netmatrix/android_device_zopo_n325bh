
include device/vanzo/$(MTK_TARGET_PROJECT)/ProjectConfig.mk
# Vanzo:wangfei on: Wed, 12 Nov 2014 21:30:14 +0800
# added for aosp management to import custom config
#added by wf
project_name:=$(shell echo $(VANZO_INNER_PROJECT_NAME))
-include zprojects/$(project_name)/$(project_name).mk
#above is added by wf
# End of Vanzo:wangfei

# PRODUCT_COPY_FILES += device/vanzo/n325bh/egl.cfg:system/lib/egl/egl.cfg
# PRODUCT_COPY_FILES += device/vanzo/n325bh/ueventd.mt6735.rc:root/ueventd.mt6735.rc

PRODUCT_COPY_FILES += device/vanzo/n325bh/factory_init.project.rc:root/factory_init.project.rc
PRODUCT_COPY_FILES += device/vanzo/n325bh/init.project.rc:root/init.project.rc
PRODUCT_COPY_FILES += device/vanzo/n325bh/meta_init.project.rc:root/meta_init.project.rc

ifeq ($(MTK_SMARTBOOK_SUPPORT),yes)
PRODUCT_COPY_FILES += device/vanzo/n325bh/sbk-kpd.kl:system/usr/keylayout/sbk-kpd.kl \
                      device/vanzo/n325bh/sbk-kpd.kcm:system/usr/keychars/sbk-kpd.kcm
endif

# Add FlashTool needed files
#PRODUCT_COPY_FILES += device/vanzo/$(MTK_TARGET_PROJECT)/EBR1:EBR1
#ifneq ($(wildcard device/vanzo/$(MTK_TARGET_PROJECT)/EBR2),)
#  PRODUCT_COPY_FILES += device/vanzo/$(MTK_TARGET_PROJECT)/EBR2:EBR2
#endif
#PRODUCT_COPY_FILES += device/vanzo/$(MTK_TARGET_PROJECT)/MBR:MBR
#PRODUCT_COPY_FILES += device/vanzo/$(MTK_TARGET_PROJECT)/MT6735_Android_scatter.txt:MT6735_Android_scatter.txt

# thermal policy
ifeq ($(TARGET_BUILD_VARIANT),eng)
    PRODUCT_COPY_FILES += device/vanzo/n325bh/thermal_6753_eng.conf:system/etc/.tp/thermal.conf
else
    PRODUCT_COPY_FILES += device/vanzo/n325bh/thermal_6753.conf:system/etc/.tp/thermal.conf
endif

PRODUCT_COPY_FILES += device/vanzo/n325bh/thermal.wfd.6753.conf:system/etc/.tp/.thermal_policy_00

# alps/vendor/mediatek/proprietary/binary/3rd-party/free/SRS_AudioEffect/srs_processing/Android.mk
ifeq ($(strip $(HAVE_SRSAUDIOEFFECT_FEATURE)),yes)
    PRODUCT_COPY_FILES += vendor/mediatek/proprietary/binary/3rd-party/free/SRS_AudioEffect/srs_processing/license/dts.lic:data/system/dts.lic
endif

# alps/vendor/mediatek/proprietary/external/GeoCoding/Android.mk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/GeoCoding/geocoding.db:system/etc/geocoding.db

# alps/vendor/mediatek/proprietary/frameworks-ext/native/etc/Android.mk
# sensor related xml files for CTS
ifneq ($(strip $(CUSTOM_KERNEL_ACCELEROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_MAGNETOMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_ALSPS)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
else
  ifneq ($(strip $(CUSTOM_KERNEL_PS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  endif
  ifneq ($(strip $(CUSTOM_KERNEL_ALS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
  endif
endif

ifneq ($(strip $(CUSTOM_KERNEL_GYROSCOPE)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_BAROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml
endif

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
endif

# USB OTG
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# GPS relative file
ifeq ($(MTK_GPS_SUPPORT),yes)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
endif

# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:system/lib/open_nfc_driver.ko

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += device/vanzo/n325bh/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# alps/mediatek/external/sip/
ifeq ($(MTK_SIP_SUPPORT),yes)
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/enable_sip/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/enable_sip/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
else
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/disable_sip/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/disable_sip/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
endif

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.acm.enable=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mount.fs=EXT4

PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=256m
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=512m

# meta tool
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.chip_ver=S01
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.version.release=$(strip $(MTK_BUILD_VERNO))
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.platform=MT6735

# set Telephony property - SIM count
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0

ifeq ($(GEMINI),yes)
  ifeq ($(MTK_DT_SUPPORT),yes)
    PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsda
  else
    ifeq ($(MTK_SVLTE_SUPPORT),yes)
      PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsda
    else
      PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds
    endif
  endif
else
  PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=ss
endif

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n325bh/factory/res/sound/testpattern1.wav:system/res/sound/testpattern1.wav
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n325bh/factory/res/sound/ringtone.wav:system/res/sound/ringtone.wav

# Keyboard layout
PRODUCT_COPY_FILES += device/mediatek/mt6735/ACCDET.kl:system/usr/keylayout/ACCDET.kl
PRODUCT_COPY_FILES += device/vanzo/n325bh/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Microphone
PRODUCT_COPY_FILES += device/vanzo/n325bh/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += device/vanzo/n325bh/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += device/vanzo/n325bh/audio_policy.conf:system/etc/audio_policy.conf

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n325bh/factory/res/images/lcd_test_00.png:system/res/images/lcd_test_00.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n325bh/factory/res/images/lcd_test_01.png:system/res/images/lcd_test_01.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/n325bh/factory/res/images/lcd_test_02.png:system/res/images/lcd_test_02.png

# overlay has priorities. high <-> low.

DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/sd_in_ex_otg

DEVICE_PACKAGE_OVERLAYS += device/vanzo/n325bh/overlay
ifdef OPTR_SPEC_SEG_DEF
  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
  endif
endif
ifneq (yes,$(strip $(MTK_TABLET_PLATFORM)))
  ifeq (480,$(strip $(LCM_WIDTH)))
    ifeq (854,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/FWVGA
    endif
  endif
  ifeq (540,$(strip $(LCM_WIDTH)))
    ifeq (960,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/qHD
    endif
  endif
endif
ifeq (yes,$(strip $(MTK_GMO_ROM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_rom
endif
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
endif
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/navbar

# Vanzo:songlixin on: Tue, 07 Apr 2015 11:06:14 +0800
# remove this apk
#ifeq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
#    PRODUCT_PACKAGES += DangerDash
#endif
# End of Vanzo: songlixin

# inherit 6752 platform
$(call inherit-product, device/mediatek/mt6735/device.mk)

# Vanzo:wangfei on: Fri, 13 Mar 2015 14:59:47 +0800
# always use the vanzo6735_65u_l device-vendor.mk
#$(call inherit-product-if-exists, vendor/vanzo/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)
prevent_replace_label=6753_65u_l1
$(call inherit-product-if-exists, vendor/vanzo/libs/vanzo$(prevent_replace_label)/device-vendor.mk)

# End of Vanzo: wangfei
