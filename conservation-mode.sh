#!/bin/bash

# Define ANSI color escape codes
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

path=$(sudo find /sys -type f -name conservation_mode 2>/dev/null)
enable="echo 1 | sudo tee $path"
disable="echo 0 | sudo tee $path"
check="cat $path"

if [ -z "$path" ]; then
    echo -e "Conservation mode file not found. This feature is either not be supported on your Lenovo laptop or the script is not compatible with your device.${NC}"
    exit 1
fi

while true; do
    read -p "Do you want to enable, disable, check status, or exit?" choice
    choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

    case "$choice" in
        "check")
            status=$(eval "$check")
            if [ "$status" -eq 1 ]; then
                echo -e "${GREEN}Conservation mode is currently enabled.${NC}"
            else
                echo -e "${RED}Conservation mode is currently disabled.${NC}"
            fi
            ;;
        "disable")
            eval "$disable"
            echo -e "${RED}Conservation mode is now disabled.${NC}"
            ;;
        "enable")
            eval "$enable"
            echo -e "${GREEN}Conservation mode is now enabled.${NC}"
            ;;
        "exit")
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice. Please enter 'enable', 'disable', 'check', or 'exit'.${NC}"
            ;;
    esac
done
