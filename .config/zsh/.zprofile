if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

if [[ "$(tty)" = "/dev/tty2" ]]; then
  pgrep sway || startway
fi

if [[ "$(tty)" = "/dev/tty3" ]]; then
  pgrep sway || startway
fi
