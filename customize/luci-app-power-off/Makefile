# Copyright 2020 Tansony72 (tansony72@gmail.com)
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk

PKG_LICENSE:=GPL-3.0+
PKG_MAINTAINER:=Tansony72 <tansony72@gmail.com>

LUCI_TITLE:=Poweroff Web UI
LUCI_DESCRIPTION:=Provides Web UI(found under System/Poweroff) to shut down (power off) your device.

LUCI_DEPENDS:=+luci-mod-admin-full
LUCI_PKGARCH:=all
PKG_RELEASE:=42

#include ../../luci.mk
include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
