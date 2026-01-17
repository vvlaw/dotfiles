git clone https://github.com/vvlaw/dotfiles.git ~/dotfiles

cd ~/dotfiles
bash install.sh

窗口管理	i3-wm, i3lock, i3-master-stack
状态栏	polybar
终端	ghostty, fish
启动器	rofi
视觉特效	picom, feh, unclutter
系统工具	flameshot, brightnessctl, pactl, nm-applet, dex
编辑器	neovim

cd ~/dotfiles
git add .
git commit -m "更新说明"
git push origin main
