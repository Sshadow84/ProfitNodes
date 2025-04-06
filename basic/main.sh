#!/bin/bash

# Скрипт для отображения основной страницы по настройке сервера

# Функция для подтверждения выбора пользователя
confirm() {
    local prompt="$1"
    read -p "$prompt [y/n, Enter = yes]: " choice
    case "$choice" in
        ""|y|Y|yes|Yes)  # Пустой ввод или "да"
            return 0  # Подтверждение действия
            ;;
        n|N|no|No)  # Любой вариант "нет"
            return 1  # Отказ от действия
            ;;
        *)
            echo "Пожалуйста, введите y или n."
            confirm "$prompt"  # Повторный запрос, если ответ не распознан
            ;;
    esac
}

show_node_list() {
    echo "Выберите действие:"
    echo -e "1. Elixir (mainnet/testnet)"
    echo -e "2. Unichain"
    echo -e "3. Ritual"
    echo -e "4. Hyperlane"
    echo -e "5. INK"
    echo "0. Выход"
}

BASE_URL="https://raw.githubusercontent.com/Sshadow84/Profit-Nodes/main/nodes"
node_menu() {
    case "$1" in
        1) bash <(curl -s ${BASE_URL}/elixir.sh) ;;
        2) bash <(curl -s ${BASE_URL}/unichain.sh) ;;
        3) bash <(curl -s ${BASE_URL}/ritual.sh) ;;   
        4) bash <(curl -s ${BASE_URL}/hyperlane.sh) ;;
        5) bash <(curl -s ${BASE_URL}/inkochain.sh) ;; 
        0) echo "Выход."; exit 0 ;;
        *) echo "Неверный выбор. Попробуйте снова." ;;
    esac
}

node_list_start() {
    while true; do
        show_node_list
        read -p "Ваш выбор: " action
        node_menu "$action"  # Используем переменную action
    done
}

# Функция для отображения меню
show_menu() {
    echo "Выберите действие:"
    echo "9. Ноды (скрипты)"
    echo "0. Выход"
}

# Функция для обработки выбора пользователя
handle_choice() {
    case "$1" in
        9) node_list_start ;;               
        0) echo "Выход."; exit 0 ;;
        *) echo "Неверный выбор. Попробуйте снова." ;;
    esac
}

while true; do
    show_menu
    read -p "Ваш выбор: " action
    handle_choice "$action"  # Используем переменную action
done
