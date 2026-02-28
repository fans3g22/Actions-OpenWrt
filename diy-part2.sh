#!/bin/bash

# 1. 彻底解决递归依赖报错：删除导致死循环的插件目录
rm -rf feeds/kenzo/luci-app-fchomo
rm -rf feeds/small/luci-app-fchomo

# 2. 彻底解决 mbedtls 编译失败：删除第三方源中冲突的加密库
rm -rf feeds/packages/libs/mbedtls
rm -rf feeds/kenzo/mbedtls
rm -rf feeds/small/mbedtls

# 3. 删除其他可能冲突的库，确保使用官方版本（防止 OpenSSL 等报错）
rm -rf feeds/packages/libs/openssl
rm -rf feeds/packages/libs/wolfssl

# 4. (可选) 修改默认 IP 为 192.168.31.1 (红米习惯)
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
