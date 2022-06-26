# Path Settings
typeset -U PATH path
path=(~/.local/bin ~/.config/{bspwm,polybar,lf}/scripts ~/.local/share/cargo/bin "${path[@]}")
export PATH

# XDG Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Default Apps
export EDITOR="lvim"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
export DIFFPROG="$EDITOR"
export TERMINAL="footclient"
export COLORTERM="truecolor"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="imv"
export READER="zathura"
export OPENER="$HOME/.local/bin/open"
export PAGER="less"

# Programs Settings
export LIBVA_DRIVER_NAME="iHD"
export VDPAU_DRIVER="nvidia"
export DOAS_ASKPASS="$HOME/.local/bin/dmenupass"
export SSH_ASKPASS="$HOME/.local/bin/dmenupass"
export MOZ_USE_XINPUT2="1"
export QT_QPA_PLATFORMTHEME="qt5ct"
# export QT_QPA_PLATFORM="wayland"
export LS_COLORS="di=00;33:ex=00;32:ln=00;34:fi=00;37:bd=32"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export LESSHISTFILE=-
export ELECTRON_TRASH=trash-cli

# FZF Settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!.git/*" --glob "!.cache/*"'
export FZF_DEFAULT_OPTS="--prompt '󰁕 ' --layout=reverse --cycle --bind 'alt-j:down,alt-k:up,enter:accept'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:50 {}'"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_ALT_C_OPTS="--preview 'exa -T {} | head -50'"

# Config dirs
export DOTFILES="$HOME/repos/.dots"
export VIMRC="${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua"

# Cleanup ~/
export TRASHBIN="${XDG_DATA_HOME:-$HOME/.local/share}/Trash/files"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/nv"
export VSCODE_PORTABLE="${XDG_DATA_HOME:-$HOME/.local/share}/vscode"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export LESSKEY="${XDG_CONFIG_HOME:-$HOME/.config}/less/lesskey"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
export MYSQL_HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/mysql_history"
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/config.py"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
export XSERVERRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xserverrc"
export XAUTHORITY="${XDG_CONFIG_HOME:-$HOME/.config}/X11/Xauthority"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

# Java env
export _JAVA_AWT_WM_NONREPARENTING=1
export JDK_JAVA_OPTIONS="
    -Dawt.useSystemAAFontSettings=on
    -Dswing.aatext=true
    -Dsun.java2d.opengl=true
    -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel
    -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
export JAVA_FONTS=/usr/share/fonts/TTF

# lf icons
LF_ICONS=$(sed ~/.config/lf/diricons \
            -e '/^[ \t]*#/d'       \
            -e '/^[ \t]*$/d'       \
            -e 's/[ \t]\+/=/g'     \
            -e 's/$/ /')
LF_ICONS=${LF_ICONS//$'\n'/:}
export LF_ICONS
