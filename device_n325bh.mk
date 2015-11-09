$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zopo/n325bh/n325bh-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zopo/n325bh/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zopo/n325bh/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	device/zopo/n325bh/rootdir/init.rc:root/init.rc \
	device/zopo/n325bh/rootdir/init.mt6735.rc:root/init.mt6735.rc \
	device/zopo/n325bh/rootdir/init.usb.rc:root/init.usb.rc \
	device/zopo/n325bh/rootdir/init.ssd.rc:root/init.ssd.rc \
	device/zopo/n325bh/rootdir/init.trace.rc:root/init.trace.rc \
	device/zopo/n325bh/rootdir/init.xlog.rc:root/init.xlog.rc \
	device/zopo/n325bh/rootdir/init.zygote32.rc:root/init.zygote32.rc \
	device/zopo/n325bh/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc \
	device/zopo/n325bh/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
	device/zopo/n325bh/rootdir/init.recovery.mt6735.rc:root/init.recovery.mt6735.rc \
	device/zopo/n325bh/rootdir/init.environ.rc:root/init.environ.rc \
	device/zopo/n325bh/rootdir/init.aee.rc:root/init.aee.rc \
	device/zopo/n325bh/rootdir/init.project.rc:root/init.project.rc \
	device/zopo/n325bh/rootdir/init.modem.rc:root/init.modem.rc \
    device/zopo/n325bh/recovery/root/fstab.mt6753:root/fstab.mt6735 
#    $(LOCAL_PATH)/rootdir/recovery.fstab:recovery.fstab

#PRODUCT_COPY_FILES_OVERRIDES += \
#    recovery/root/ueventd.rc \
#    root/fstab.goldfish \
#    root/init.goldfish.rc \
#    recovery/root/fstab.goldfish 



$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
#PRODUCT_NAME := full_n325bh_a
#PRODUCT_DEVICE := n325bh_a

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
ro.adb.secure=0 \
persist.service.acm.enable=0 \
persist.sys.usb.config=mtp \
ro.mount.fs=EXT4 \
ro.persist.partition.support=no \
ro.cip.partition.support=no
