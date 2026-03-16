#!/usr/bin/env bash

killall -q -15 polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

sleep 0.3  # 给 i3 一点反应时间

if [ -f "/tmp/polybar_is_full" ]; then
    rm "/tmp/polybar_is_full"
    polybar main >/dev/null 2>&1 &
else
    touch "/tmp/polybar_is_full"
    polybar full >/dev/null 2>&1 &
fi
