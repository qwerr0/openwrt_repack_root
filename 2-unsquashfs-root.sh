#!/bin/bash

# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 切换到脚本所在的目录
cd "$script_dir"

# 复制出 root 档案
cp -f sysupgrade-*/root ./root

# 删除原有的档案
rm -rf ./squashfs-root

# 解压
unsquashfs root

# 删除原来的root档案
rm -f ./root 2> /dev/null
