#!/bin/bash

# 备份原有的 sources.list 文件
cp /etc/apt/sources.list /etc/apt/sources.list.bak

# 更新 sources.list 文件
cat <<'EOF' > /etc/apt/sources.list
deb https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb https://mirrors.ustc.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
deb https://mirrors.ustc.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
EOF

# 备份原有的 pve-enterprise.list 文件
if [ -f /etc/apt/sources.list.d/pve-enterprise.list ]; then
  cp /etc/apt/sources.list.d/pve-enterprise.list /etc/apt/sources.list.d/pve-enterprise.list.bak
fi

# 更新 pve-enterprise.list 文件
cat <<'EOF' > /etc/apt/sources.list.d/pve-enterprise.list
deb https://mirrors.cernet.edu.cn/proxmox/debian/pve bookworm pve-no-subscription
EOF

# 备份原有的 ceph.list 文件
if [ -f /etc/apt/sources.list.d/ceph.list ]; then
  cp /etc/apt/sources.list.d/ceph.list /etc/apt/sources.list.d/ceph.list.bak
fi

# 更新 ceph.list 文件
cat <<'EOF' > /etc/apt/sources.list.d/ceph.list
deb https://mirrors.ustc.edu.cn/proxmox/debian/ceph-quincy bookworm no-subscription
EOF

echo "国内源替换完成并已备份原有文件。"
