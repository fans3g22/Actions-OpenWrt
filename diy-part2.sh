#!/bin/bash

# 强行删除插件包里冲突的 mbedtls 源码
rm -rf feeds/packages/libs/mbedtls
rm -rf feeds/kenzo/mbedtls
rm -rf feeds/small/mbedtls

# 顺便清理一下可能会导致其他冲突的加密库（可选但推荐）
rm -rf feeds/packages/libs/openssl
rm -rf feeds/packages/libs/wolfssl
