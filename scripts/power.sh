upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep energy-rate | awk '{printf "%2.2f W", $2}'
