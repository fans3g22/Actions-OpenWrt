#!/bin/bash

# 1. 彻底解决递归依赖报错：删除导致死循环的插件目录
rm -rf feeds/kenzo/luci-app-fchomo
rm -rf feeds/small/luci-app-fchomo

# 2. 彻底解决 mbedtls 编译失败：删除第三方源中冲突的加密库和软链接
rm -rf feeds/packages/libs/mbedtls
rm -rf feeds/kenzo/mbedtls
rm -rf feeds/small/mbedtls
rm -rf package/feeds/packages/mbedtls
rm -rf package/feeds/kenzo/mbedtls
rm -rf package/feeds/small/mbedtls

# 3. 删除其他可能冲突的库，确保使用官方版本
rm -rf feeds/packages/libs/openssl
rm -rf feeds/packages/libs/wolfssl

# 4. 【核心修复】解决 GCC 14 下 mbedtls 的内联错误 (target specific option mismatch)
# 通过添加编译器 flag：强制不使用内置 memset，并忽略特定的选项不匹配错误
sed -i 's/TARGET_CFLAGS +=/TARGET_CFLAGS += -fno-builtin-memset -Wno-error=target-specific-option-mismatch/g' package/libs/mbedtls/Makefile

# 5. 清理之前的编译残留目录，确保补丁能应用到新源码上
rm -rf build_dir/target-aarch64_cortex-a53_musl/mbedtls-*

# 6. (可选) 修改默认 IP 为 192.168.31.1 (红米习惯)
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
