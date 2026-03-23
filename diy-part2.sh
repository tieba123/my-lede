#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 1. 查找 Cudy TR3000 v1 的 DTS 文件路径
DTS_FILE=$(find target/linux/ -name "mt7981b-cudy-tr3000-v1.dts")

# 2. 如果找到了文件，就把复位键的键值 KEY_RESTART 替换为无效键值 KEY_RESERVED
if [ -n "$DTS_FILE" ]; then
    sed -i 's/KEY_RESTART/KEY_RESERVED/g' $DTS_FILE
    echo "成功：已将 $DTS_FILE 中的复位键失效化处理！"
fi
