THEOS_DEVICE_IP = 10.0.0.142
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0
DEBUG = 0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = AppInfo
AppInfo_FILES = main.mm AppInfo.m
AppInfo_FRAMEWORKS += MobileCoreServices 
include $(THEOS_MAKE_PATH)/tool.mk
