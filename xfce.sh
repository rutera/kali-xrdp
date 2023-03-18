#!/bin/sh

echo "[+] Installing Xfce, this will take a while" | tee -a install.log
apt-get -qq update && apt-get -qq dist-upgrade -y && apt-get -qq install -y kali-desktop-xfce xrdp | tee -a install.log

echo "[+] Configuring XRDP to listen to port 3390 (but not starting the service)..." | tee -a install.log
systemctl edit xrdp.service <<EOF
[Service]
ExecStart=
ExecStart=/usr/sbin/xrdp --port 3390
EOF

echo "[+] Installation complete!" | tee -a install.log
