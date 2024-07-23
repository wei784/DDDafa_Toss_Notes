#!/bin/bash

# 还原 /usr/share/pve-manager/js/pvemanagerlib.js
if [ -f /usr/share/pve-manager/js/pvemanagerlib.js_orig ]; then
  mv /usr/share/pve-manager/js/pvemanagerlib.js_orig /usr/share/pve-manager/js/pvemanagerlib.js
  echo "/usr/share/pve-manager/js/pvemanagerlib.js 已还原。"
else
  echo "未找到 /usr/share/pve-manager/js/pvemanagerlib.js_orig 备份文件，无法还原。"
fi

# 还原 /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js (第一处修改)
if [ -f /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js_orig ]; then
  mv /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js_orig /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
  echo "/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js 已还原。"
else
  echo "未找到 /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js_orig 备份文件，无法还原。"
fi

# 重启 pveproxy 服务
systemctl restart pveproxy

echo "还原完成，自动重启web控制台"
