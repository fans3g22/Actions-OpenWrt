#!/bin/bash

# 1. 修改默认 IP 为 192.168.31.1
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# 2. 如果你还保留了方案 B 的精简源，这里可以不用写 rm -rf
# 但为了保险，可以留着这一行清理递归依赖
find feeds/ -name "luci-app-fchomo" -type d | xargs rm -rf
