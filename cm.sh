#!/bin/bash

# Define ANSI color escape codes and some variables
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
check_module="sudo lsmod | grep ideapad_laptop"
path=$(sudo find /sys -type f -name conservation_mode 2>/dev/null)

if [ -z "$path" ]; then
    echo -e "${RED}Conservation mode file not found. This feature may not be supported on your Lenovo laptop.${NC}"
    exit 1
fi

if [ -z "$check_module" ]; then
    echo -e "${RED}ideapad_laptop Kernel module not loaded/running. This feature is either not supported on your Lenovo laptop or the script is not compatible with your device.${NC}"
    exit 1
fi

# Initialize status variable
status=""

# Function to check the status
check_status() {
    status=$(cat "$path")
    if [ "$status" -eq 1 ]; then
        echo -e "${BLUE}Conservation mode is currently ${GREEN}enabled.${NC}"
    else
        echo -e "${BLUE}Conservation mode is currently ${RED}disabled.${NC}"
    fi
}

notification_send() {
    local status="$1"
    if [ "$status" -eq 1 ]; then
        notify-send "Conservation Mode" "Conservation mode is currently enabled."
    else
        notify-send "Conservation Mode" "Conservation mode is currently disabled."
    fi
}

# Initialize an array for non-notify arguments and notify flag
non_notify_args=()
notify_flag=0

# Parse command-line arguments, excluding --notify
while [[ $# -gt 0 ]]; do
    case "$1" in
        --enable)
            sudo bash -c "echo 1 > $path"
            non_notify_args+=("$1")
            shift
            ;;
        --disable)
            sudo bash -c "echo 0 > $path"
            non_notify_args+=("$1")
            shift
            ;;
        --status)
            non_notify_args+=("$1")
            shift
            ;;
        --notify)
            notify_flag=1
            shift
            ;;
        *)
            non_notify_args+=("$1")
            shift
            ;;
    esac
done

# Check if --notify is specified and send the notification
if [ $notify_flag -eq 1 ]; then
    if [ -z "$status" ]; then
        check_status
    fi
    notification_send "$status"
fi

# Reconstruct the command with non_notify_args
set -- "${non_notify_args[@]}"

# If --status is specified, check and display status
if [[ "$*" == *"--status"* ]]; then
    check_status
fi
