#!/bin/bash

dir="/etc/apt/sources.list.d/"
file="/etc/apt/sources.list"
backup_dir="/etc/apt/backup/"

# 创建备份目录
mkdir -p "$backup_dir"

# 备份sources.list.d目录
if [ -d "$dir" ]; then
  echo "Backing up directory $dir to $backup_dir..."
  cp -r "$dir" "$backup_dir"
  echo "Directory backed up."
fi

# 备份sources.list文件
if [ -f "$file" ]; then
  echo "Backing up file $file to $backup_dir..."
  cp "$file" "$backup_dir"
  echo "File backed up."
fi

# 删除sources.list.d目录
if [ -d "$dir" ]; then
  echo "Deleting directory $dir..."
  rm -rf "$dir"
  echo "Directory deleted."
else
  echo "Directory $dir does not exist. Skipping deletion."
fi

# 替换sources.list文件内容
echo "Replacing content of $file..."

echo "deb https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware" > "$file"
echo "deb https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware" >> "$file"
echo "deb https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware" >> "$file"
echo "deb https://mirrors.ustc.edu.cn/debian-security bookworm-security main" >> "$file"
echo "deb https://mirrors.ustc.edu.cn/proxmox/debian bookworm pve-no-subscription" >> "$file"

echo "Content replaced."
