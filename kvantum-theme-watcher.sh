#!/bin/bash

CONFIG_DIR="$HOME/.config/Kvantum"
CONFIG_FILE="$CONFIG_DIR/kvantum.kvconfig"

apply_theme() {
    if [ -f "$CONFIG_FILE" ]; then
        THEME=$(grep -i '^theme=' "$CONFIG_FILE" | cut -d'=' -f2 | tr -d '[:space:]')
        if [ -n "$THEME" ]; then
            plasma-apply-colorscheme "$THEME" > /dev/null 2>&1
        fi
    fi
}
mkdir -p "$CONFIG_DIR"
apply_theme
while inotifywait -e modify,create -q "$CONFIG_DIR" > /dev/null 2>&1; do
    apply_theme
done
