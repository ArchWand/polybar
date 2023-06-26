#!/usr/bin/zsh

# Terminate already running bar instances
pkill -9 polybar

# and wait for processes to stop
while pgrep -u $UID -x polybar; do; done

# Launch the bar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main &
done

pkill -15 -f "bash $HOME/scripts/hideIt.sh"
# Wait for polybars to populate
while [[ "$(xdotool search --class polybar | wc -w)" -lt "$(polybar --list-monitors | wc -l)" ]]; do
done
bspc config bottom_padding 0

# Auto-hide
for id in $(xdotool search --class polybar); do
	# ~/scripts/hideIt.sh --id $id --peek 3 --hover -d bottom --no-trans &
	~/scripts/hideIt.sh --id $id --peek 3 --hover -d bottom --steps 5 &
done
