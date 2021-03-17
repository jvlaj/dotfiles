#!/usr/bin/env bash

rofi_command="rofi -theme ~/.config/rofi/powermenu.rasi -m -4"

# Options
shutdown=""
reboot=""
lock=""
logout=""

user=$(whoami)

# Variable passed to rofi
options="$shutdown\n$lock\n$reboot\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"

case $chosen in
    $shutdown)
		answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p "襤 Shutdown now?" -theme ~/.config/rofi/confirm.rasi)
		;;
    $reboot)
		answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p "ﰇ Reboot now?" -theme ~/.config/rofi/confirm.rasi)
        ;;
     $lock)
	answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p " Lock now?" -theme ~/.config/rofi/confirm.rasi)
        ;;
     $logout)
		answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p "  Logout now?" -theme ~/.config/rofi/confirm.rasi)
        ;;
esac

[[ ${answer,,} != yes ]] && exit 1

### Modify to your system ###
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
	xlock
        ;;
    $logout)
        pkill -KILL -U $user
        ;;
esac
