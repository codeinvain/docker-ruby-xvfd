#!/bin/bash
export DISPLAY=:1
export SCREEN=0
Xvfb $DISPLAY -screen $SCREEN 1024x768x16 &> /var/xvfb.log  &

if [ "$VNC" = "true" ]
then
  exec startfluxbox &
  sleep 1
  x11vnc -noxrecord -noxfixes -noxdamage -nopw -o /var/x11vnc.log -forever -bg -rfbport 5900
fi
