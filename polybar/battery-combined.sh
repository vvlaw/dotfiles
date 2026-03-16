#!/bin/bash

# 获取两块电池的电量百分比
bat1=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
bat2=$(cat /sys/class/power_supply/BAT2/capacity 2>/dev/null)

# 如果只有一块电池，则直接输出
if [ -z "$bat2" ]; then
  avg=$bat1
else
  avg=$(( (bat1 + bat2) / 2 ))
fi

# 判断充电状态
status1=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)
status2=$(cat /sys/class/power_supply/BAT2/status 2>/dev/null)
status="$status1$status2"

# 根据电量和状态选择图标
if [[ "$status" == *"Charging"* ]]; then
  icon=""
elif (( avg <= 20 )); then
  icon=""
elif (( avg <= 40 )); then
  icon=""
elif (( avg <= 60 )); then
  icon=""
elif (( avg <= 80 )); then
  icon=""
else
  icon=""
fi

# 输出到 polybar：图标 + 百分比
echo "%{F#8BE9FD}${icon}%{F-} ${avg}%"y

