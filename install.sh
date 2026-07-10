mkdir -p ~/.local/bin
wget -O ~/.local/bin/kvantum-theme-watcher.sh https://raw.githubusercontent.com/Lobanokivan11/kvantum-kde-sync/refs/heads/main/kvantum-theme-watcher.sh
chmod +x ~/.local/bin/kvantum-theme-watcher.sh
mkdir -p ~/.config/systemd/user
wget -O ~/.config/systemd/user/kvantum-watcher.service https://raw.githubusercontent.com/Lobanokivan11/kvantum-kde-sync/refs/heads/main/kvantum-watcher.service
systemctl --user daemon-reload                                                
systemctl --user enable --now kvantum-watcher.service
