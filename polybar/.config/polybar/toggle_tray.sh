#!/usr/bin/env bash

# 1. 优雅关闭并静默报错
killall -q -15 polybar >/dev/null 2>&1

# 2. 等待旧进程完全释放 Socket
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# 3. 切换逻辑
if [ -f "/tmp/polybar_is_full" ]; then
    rm "/tmp/polybar_is_full"
    # 后台运行并静默所有输出
    polybar main >/dev/null 2>&1 &
else
    touch "/tmp/polybar_is_full"
    polybar full >/dev/null 2>&1 &
fi
