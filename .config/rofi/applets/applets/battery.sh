#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/battery.rasi"

## Get data
CHARGE="$(cat /sys/class/power_supply/BAT0/status)"
BATTERY="$(cat /sys/class/power_supply/BAT0/capacity)"

active=""
urgent=""

if [[ $CHARGE = *"Charging"* ]]; then
    active="-a 1"
    ICON_CHRG=""
    MSG=$CHARGE
elif [[ $CHARGE = *"Full"* ]]; then
    active="-u 1"
    ICON_CHRG=""
    MSG=$CHARGE
else
    urgent="-u 1"
    ICON_CHRG=""
    MSG=$CHARGE
fi

# Discharging
#if [[ $CHARGE -eq 1 ]] && [[ $BATTERY -eq 100 ]]; then
#    ICON_DISCHRG=""
if [[ $BATTERY -ge 1 ]] && [[ $BATTERY -le 9 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 10 ]] && [[ $BATTERY -le 39 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 40 ]] && [[ $BATTERY -le 59 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 60 ]] && [[ $BATTERY -le 79 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 80 ]] && [[ $BATTERY -le 100 ]]; then
    ICON_DISCHRG=""
fi

## Icons
ICON_PMGR=""

options="$ICON_DISCHRG\n$ICON_CHRG\n$ICON_PMGR"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$BATTERY%" -dmenu $active $urgent -selected-row 0)"
case $chosen in
    $ICON_CHRG)
        ;;
    $ICON_DISCHRG)
        ;;
    $ICON_PMGR)
	$HOME/.config/rofi/bin/applet_powermenu
        ;;
esac

