#!/usr/bin/env bash

# 进入脚本所在目录
cd "$(dirname "$0")"

# 定义所有要关联的包
apps=("i3" "polybar" "fish" "rofi" "picom" "ghostty" "nvim")

echo "正在建立配置文件软链接..."
for app in "${apps[@]}"; do
    stow "$app"
    echo "✔ $app 已链接"
done

echo "还原完成！请确保已安装 i3, polybar, rofi, picom, ghostty 等软件。"
