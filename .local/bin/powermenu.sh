#!/bin/bash

SELECTION="$(printf "󰌾 Lock\0󰤄 Sleep\0󰜗 Hibernate\0 Restart…\0󰐥 Shut Down…" | fuzzel --dmenu0 --anchor=top-left -w 20 -x 5 -y 5 -l 5)"

case "$SELECTION" in
	*"Lock")
        hyprlock ;;
	*"Sleep")
        systemctl suspend ;;
	*"Hibernate")
        systemctl hibernate;;
	*"Restart…")
        systemctl reboot;;
	*"Shut Down…")
        systemctl poweroff;;
esac

