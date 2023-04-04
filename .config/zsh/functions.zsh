# search for all scripts and dotfiles, then open them with editor of choice
cfg() {
  fd . --hidden --type=file -E "Microsoft" ~/.config/ |
    fzf --preview 'bat --color=always --line-range :50 {}' --bind 'enter:become{lvim {+}}'
}

# search for a package and installed if needed
pacs() {
  if [ -x "$(command -v paru)" ]; then
      paru -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'paru -Si {1}' | cut -d " " -f 1 | xargs -ro paru -S --needed
  else
      pacman -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'pacman -Si {1}' | cut -d " " -f 1 | xargs -ro sudo pacman -S --needed
  fi
}

# convert microsoft teams recording
unicon() {
  ffmpeg -i "$1" -c:v h264_nvenc -rc constqp -qp 36 -filter:v "crop=1670:1080:0:0" -c:a aac -b:a 42k "${1%.mp4}_converted.mp4"
}

uniload() {
  yt-dlp --allow-unplayable-formats -f bv,ba -o "video.%(ext)s" "$1"
  ffmpeg -i video.mp4 -i video.m4a -c copy "$2"
}

whichpkg() {
  pacman -Qqo "$@"
}

# run command line as user root via sudo:
function sudo-command-line () {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER != sudo\ * ]]; then
        BUFFER="sudo $BUFFER"
        CURSOR=$(( CURSOR+5 ))
    fi
}
zle -N sudo-command-line

# Yank to the system clipboard
function vi-yank-wlclip {
    zle vi-yank
    echo "$CUTBUFFER" | wl-copy -n
}
zle -N vi-yank-wlclip

toggleSingleString() {
  LBUFFER=`echo $LBUFFER | sed "s/\(.*\) /\1 '/"`
  RBUFFER=`echo $RBUFFER | sed "s/\($\| \)/' /"`
  zle redisplay
}
zle -N toggleSingleString

toggleDoubleString() {
  LBUFFER=`echo $LBUFFER | sed 's/\(.*\) /\1 "/'`
  RBUFFER=`echo $RBUFFER | sed 's/\($\| \)/" /'`
  zle redisplay
}
zle -N toggleDoubleString

clearString() {
  LBUFFER=`echo $LBUFFER | sed 's/\(.*\)\('"'"'\|"\).*/\1\2/'`
  RBUFFER=`echo $RBUFFER | sed 's/.*\('"'"'\|"\)\(.*$\)/\1\2/'`
  zle redisplay
}
zle -N clearString
