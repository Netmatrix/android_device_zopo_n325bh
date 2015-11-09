## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := n325bh

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zopo/n325bh/device_n325bh.mk)

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n325bh
PRODUCT_NAME := cm_325bh
PRODUCT_BRAND := zopo
PRODUCT_MODEL := n325bh
PRODUCT_MANUFACTURER := zopo
