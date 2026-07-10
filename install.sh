#!/bin/bash
echo "Installing Script..."
mkdir -p ~/.local/bin
cp kvantum-theme-watcher.sh ~/.local/bin/kvantum-theme-watcher.sh 
chmod +x ~/.local/bin/kvantum-theme-watcher.sh
echo "Installing Systemd Unit..."
mkdir -p ~/.config/systemd/user
cp kvantum-watcher.service ~/.config/systemd/user/kvantum-watcher.service
echo "Enabling Systemd Unit..."
systemctl --user daemon-reload                                                
systemctl --user enable --now kvantum-watcher.service
echo "Install is ended succesfully..."
