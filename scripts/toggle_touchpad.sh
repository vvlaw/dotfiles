#!/bin/bash
# toggle_touchpad.sh — 切换 Microsoft Surface 触控板启用/禁用

# 自动检测带 “Touchpad” 的设备（你的是 Microsoft Surface 045E:09AF Touchpad）
DEVICE_ID=$(xinput list | grep -i "Touchpad" | grep -o 'id=[0-9]*' | cut -d= -f2 | head -n1)

FLAG="/tmp/touchpad_disabled"

echo "Detected DEVICE_ID=$DEVICE_ID"

if [ -z "$DEVICE_ID" ]; then
    echo "No touchpad device found."
    exit 1
fi

if [ -f "$FLAG" ]; then
    xinput enable "$DEVICE_ID"
    rm "$FLAG"
    echo "Touchpad enabled"
else
    xinput disable "$DEVICE_ID"
    touch "$FLAG"
    echo "Touchpad disabled"
fi
