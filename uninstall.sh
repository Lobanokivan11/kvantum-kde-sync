#!/bin/bash
echo "Stopping and Disabling Systemd Unit..."
systemctl --user stop kvantum-watcher.service
systemctl --user disable kvantum-watcher.service
echo "Deleting Unit File..."
rm -f ~/.config/systemd/user/kvantum-watcher.service
systemctl --user daemon-reload
echo "Deleting script..."
rm -f ~/.local/bin/kvantum-theme-watcher.sh
echo "Delete ended succesfully!"
