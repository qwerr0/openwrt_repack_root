#!/bin/bash

# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 切换到脚本所在的目录
cd "$script_dir"

rm -rf ./squashfs-root 2>/dev/null
rm -rf ./sysupgrade-* 2>/dev/null
rm -rf ./root 2>/dev/null
