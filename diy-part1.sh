#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 1. 暴力删除上游源码默认带的所有 helloworld 引用，斩断冲突根源
sed -i '/helloworld/d' feeds.conf.default

# 2. 安全地添加你指定的 helloworld 源码
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 如果你还需要在固件里集成 ZeroTier 等其他依赖 feeds 的插件，也可以参照这种防冲突的格式写在下面
