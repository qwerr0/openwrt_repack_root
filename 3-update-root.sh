#!/bin/bash

# 获取脚本所在的目录
script_dir=$(dirname "$0")

# 切换到脚本所在的目录
cd "$script_dir"

# 移动到root目录
cd squashfs-root

# 要处理的目录名列表
# 如果你需要更新自己需要的其他目录请在这里添加
dirs=("bin" "data" "etc" "ini" "lib" "root" "sawf" "sbin" "usr" "www" "home")

for dir in "${dirs[@]}"; do
  tar_file="../${dir}.tar"
  if [ -f "$tar_file" ]; then
    echo "更新目录 $tar_file"
    # 删除当前目录下的对应文件夹
    rm -rf "./$dir"
    # 解压 tar 文件到当前目录
    tar -xf "$tar_file" -C .
    # 删除 tar 文件
    rm -f "$tar_file"
  else
    echo "没有找到 $dir.tar 因此不更新"
  fi
done

# 返回目录
cd ..
