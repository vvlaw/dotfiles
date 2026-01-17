#!/usr/bin/env bash

# 1. 终止所有正在运行的 polybar 进程
killall -q -15 polybar

# 2. 等待进程彻底关闭
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. 启动默认的条（不带托盘的 main）
# 这里的 "main" 必须对应你 config.ini 里的 [bar/main]
polybar main >/dev/null 2>&1 &
