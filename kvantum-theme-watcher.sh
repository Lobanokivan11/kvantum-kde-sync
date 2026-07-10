#!/bin/bash

CONFIG_DIR="$HOME/.config/Kvantum"
CONFIG_FILE="$CONFIG_DIR/kvantum.kvconfig"

apply_theme() {
    if [ -f "$CONFIG_FILE" ]; then
        # Извлекаем имя темы
        THEME=$(grep -i '^theme=' "$CONFIG_FILE" | cut -d'=' -f2 | tr -d '[:space:]')

        # Правильная проверка: если строка THEME не пустая
        if [ -n "$THEME" ]; then
            plasma-apply-colorscheme "$THEME" > /dev/null 2>&1
        fi
    fi
}

# Создаем директорию Kvantum, если её вдруг нет, чтобы inotifywait не падал
mkdir -p "$CONFIG_DIR"

# Первичный запуск при старте сервиса
apply_theme

# Отслеживаем изменение папки и файла. Если файл удалят/пересоздадут, скрипт продолжит работу.
while inotifywait -e modify,create -q "$CONFIG_DIR" > /dev/null 2>&1; do
    apply_theme
done
