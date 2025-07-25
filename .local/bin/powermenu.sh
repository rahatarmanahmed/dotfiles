#!/bin/bash

SELECTION="$(printf "󰌾 Lock\n󰤄 Sleep\n󰜗 Hibernate\n Restart…\n󰐥 Shut Down…" | tofi)"

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

