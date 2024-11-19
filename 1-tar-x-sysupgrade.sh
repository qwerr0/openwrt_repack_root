#!/bin/bash

# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 切换到脚本所在的目录
cd "$script_dir"

# 找到当前目录下以-squashfs-nand-sysupgrade.bin结尾的文件
tar_file=$(find . -maxdepth 1 -type f -name '*-squashfs-nand-sysupgrade.bin')

# 如果找不到符合条件的文件，退出脚本
if [ -z "$tar_file" ]; then
  echo "未找到以-squashfs-nand-sysupgrade.bin结尾的文件"
  exit 1
fi

# 删除可能存在的档案
rm -rf ./sysupgrade-*

# 解压tar文件
tar -xvf "$tar_file"

echo "解压完成：$tar_file"
