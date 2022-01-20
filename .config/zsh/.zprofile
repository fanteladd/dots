if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

if [[ "$(tty)" = "/dev/tty2" ]]; then
  pgrep river || startway sway
fi
