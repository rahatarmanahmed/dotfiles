#!/bin/bash

SELECTION="$(printf "󰌾 Lock\0󰤄 Sleep\0󰜗 Hibernate\0󰗽 Log Out $USER…\0 Restart…\0󰐥 Shut Down…" | fuzzel --dmenu0)"

case "$SELECTION" in
	*"Lock")
        hyprlock ;;
	*"Sleep")
        systemctl suspend ;;
	*"Hibernate")
        systemctl hibernate;;
	*"Log Out…")
        hyprctl dispatch exit;;
	*"Restart…")
        systemctl reboot;;
	*"Shut Down…")
        systemctl poweroff;;
esac

