#!/bin/bash

# 备份并修改 /usr/share/pve-manager/js/pvemanagerlib.js
sed -i_orig "s/data.status === 'Active'/true/g" /usr/share/pve-manager/js/pvemanagerlib.js

# 备份并修改 /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
sed -i_orig "s/if (res === null || res === undefined || \!res || res/if(/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
sed -i_orig "s/.data.status.toLowerCase() !== 'active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js

# 重启 pveproxy 服务
systemctl restart pveproxy

echo "删除订阅弹窗完成，自动重启web控制台"
