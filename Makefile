IPHONE_ARCHS = arm64
TARGET = appletv:12.1
DEBUG = 0
THEOS_DEVICE_IP=twelve.local

include $(THEOS)/makefiles/common.mk

TOOL_NAME = screencapture
screencapture_FILES = screencapture.m
screencapture_CFLAGS += -fvisibility=hidden
screencapture_INSTALL_PATH = /usr/bin
screencapture_Frameworks += WebCore ImageIO Foundation CFNetwork AppSupport UIKit IOKit MobileCoreServices
screencapture_CODESIGN_FLAGS=-Sent.plist
include $(THEOS_MAKE_PATH)/tool.mk
