#!/bin/bash

# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 切换到脚本所在的目录
cd "$script_dir"

# 使用mksquashfs压缩为root文件
mksquashfs ./squashfs-root root -comp xz -b 262144

# 替换掉原来的root档案
cp -f ./root sysupgrade-*/root

# 删除原来的root档案
rm -f ./root
