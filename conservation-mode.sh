#!/bin/bash

# Define ANSI color escape codes and some variables
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
check_module="sudo lsmod | grep ideapad_laptop"
path=$(sudo find /sys -type f -name conservation_mode 2>/dev/null)

if [ -z "$path" ]; then
    echo -e "error code 0(check the github trouble shooting guide)"
    echo -e "${RED}Conservation mode file not found. This feature is either not be supported on your Lenovo laptop or the script is not compatible with your device.${NC}"
    exit 1
fi

if [ -z "$check_module" ]; then
    echo -e "error code 1(check the github troubleshooting guide)"
    echo -e "${RED}ideapad_laptop Kernel module not loaded/running. This feature is either not be supported on your Lenovo laptop or the script is not compatible with your device.${NC}"
    exit 1
fi

# Function to check the status
check_status() {
    status=$(cat "$path")
    if [ "$status" -eq 1 ]; then
        echo -e "${BLUE}Conservation mode is currently ${GREEN}enabled.${NC}"
    else
        echo -e "${BLUE}Conservation mode is currently ${RED}disabled.${NC}"
    fi
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --enable)
            sudo bash -c "echo 1 > $path"
            echo -e "${GREEN}Conservation mode is now enabled.${NC}"
            ;;
        --disable)
            sudo bash -c "echo 0 > $path"
            echo -e "${RED}Conservation mode is now disabled.${NC}"
            ;;
        --status)
            check_status
            ;;
        *)
            echo -e "${RED}Invalid option: $1${NC}"
            exit 1
            ;;
    esac
    shift
done
