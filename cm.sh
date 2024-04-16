#!/bin/bash

# Define ANSI color escape codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# the path to the firmware
path=$(sudo find /sys -type f -name conservation_mode 2>/dev/null)

# check for firmware
if [ -z "$path" ]; then
    echo -e "${RED}Conservation mode firmware not found. This feature may not be supported on your Lenovo laptop.${NC}"
    exit 1
fi

#check for module
check_module=$(sudo lsmod | grep ideapad_laptop)
if [ -z "$check_module" ]; then
    echo -e "${RED}The ideapad_laptop module not loaded/running. This feature is either not supported on your Lenovo laptop or the script is not compatible with your device.${NC}"
    exit 1
fi

# Function to check the status
status() {
    local status=$(cat "$path")
    if [ "$status" -eq 1 ]; then
        echo -e "${GREEN}Conservation mode is currently enabled.${NC}"
    else
        echo -e "${RED}Conservation mode is currently disabled.${NC}"
    fi
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        on)
            sudo bash -c "echo 1 > $path"
            echo -e "${GREEN}Enabled conservation mode!${NC}"
            ;;
        off)
            sudo bash -c "echo 0 > $path"
            echo -e "${RED}Disabled conservation mode!${NC}"
            ;;
        status)
            status
            ;;
    esac
    shift
done

# real
