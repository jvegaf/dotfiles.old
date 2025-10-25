#!/usr/bin/env bash

killall -q picom

echo "---" | tee -a /tmp/picom.log

sleep 1

picom --config $HOME/.config/picom/picom.conf >>/tmp/picom.log 2>&1 &

# picom --corner-radius=30 --window-shader-fg=rounded-borders.glsl --backend=glx

echo "Picom launched..."
