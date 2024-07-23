#!/bin/bash

# 还原 /etc/apt/sources.list
if [ -f /etc/apt/sources.list.bak ]; then
  mv /etc/apt/sources.list.bak /etc/apt/sources.list
  echo "/etc/apt/sources.list 已还原。"
else
  echo "未找到 /etc/apt/sources.list.bak 备份文件，无法还原。"
fi

# 还原 /etc/apt/sources.list.d/pve-enterprise.list
if [ -f /etc/apt/sources.list.d/pve-enterprise.list.bak ]; then
  mv /etc/apt/sources.list.d/pve-enterprise.list.bak /etc/apt/sources.list.d/pve-enterprise.list
  echo "/etc/apt/sources.list.d/pve-enterprise.list 已还原。"
else
  echo "未找到 /etc/apt/sources.list.d/pve-enterprise.list.bak 备份文件，无法还原。"
fi

# 还原 /etc/apt/sources.list.d/ceph.list
if [ -f /etc/apt/sources.list.d/ceph.list.bak ]; then
  mv /etc/apt/sources.list.d/ceph.list.bak /etc/apt/sources.list.d/ceph.list
  echo "/etc/apt/sources.list.d/ceph.list 已还原。"
else
  echo "未找到 /etc/apt/sources.list.d/ceph.list.bak 备份文件，无法还原。"
fi

echo "备份还原完成。"
