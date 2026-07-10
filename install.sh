mkdir -p ~/.local/bin
cp kvantum-theme-watcher.sh ~/.local/bin/kvantum-theme-watcher.sh 
chmod +x ~/.local/bin/kvantum-theme-watcher.sh
mkdir -p ~/.config/systemd/user
cp kvantum-watcher.service ~/.config/systemd/user/kvantum-watcher.service
systemctl --user daemon-reload                                                
systemctl --user enable --now kvantum-watcher.service
