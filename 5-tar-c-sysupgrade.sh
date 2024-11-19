#!/bin/bash

# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 切换到脚本所在的目录
cd "$script_dir"

# 获取当前日期和时间，格式为YYYYMMDD_HHMMSS
current_time=$(date +"%Y%m%d_%H%M%S")

# 目标文件名
tar_file="${current_time}-squashfs-nand-sysupgrade-mod.bin"

# 找到所有以sysupgrade-开头的文件夹
folders=$(find . -maxdepth 1 -type d -name 'sysupgrade-*')

# 如果没有找到符合条件的文件夹，退出脚本
if [ -z "$folders" ]; then
  echo "未找到以sysupgrade-开头的文件夹"
  exit 1
fi

# 压缩这些文件夹为目标文件名
tar -cvf "$tar_file" --transform 's|^\./||' $folders

echo "压缩完成：$tar_file"
