#!/bin/bash

backup_dir="/etc/apt/backup/"
dir="/etc/apt/sources.list.d/"
file="/etc/apt/sources.list"

# 恢复sources.list.d目录
if [ -d "${backup_dir}sources.list.d" ]; then
  echo "Restoring directory $dir from $backup_dir..."
  rm -rf "$dir"
  cp -r "${backup_dir}sources.list.d" "$dir"
  echo "Directory restored."
else
  echo "Backup of directory $dir does not exist. Skipping restoration."
fi

# 恢复sources.list文件
if [ -f "${backup_dir}$(basename $file)" ]; then
  echo "Restoring file $file from $backup_dir..."
  cp "${backup_dir}$(basename $file)" "$file"
  echo "File restored."
else
  echo "Backup of file $file does not exist. Skipping restoration."
fi
