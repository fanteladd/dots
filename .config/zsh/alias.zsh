# SystemD
alias \
  status="systemctl status" \
  enable="systemctl enable" \
  disable="systemctl disable" \
  start="systemctl start" \
  stop="systemctl stop" \
  restart="systemctl restart" \
  reload="systemctl daemon-reload"

# Pacman/Paru
if [ -x "$(command -v paru)" ]; then
  alias  \
    p="nice -n 20 paru -Syu ; pkill -SIGRTMIN+8 waybar" \
    pacin="paru -S" \
    pacrm="paru -Rns" \
    pacup="paru -Syyy" \
    pacls="paru -Qi" \
    paclean="paru -c"
else
  alias  \
    p="sudo pacman -Syu ; polybar-msg cmd restart >&/dev/null" \
    pacin="sudo pacman -S" \
    pacrm="sudo pacman -Rns" \
    pacup="sudo pacman -Syyy" \
    pacls="sudo pacman -Qi" \
    paclean="sudo pacman -Rns --noconfirm $(pacman -Qttdq)"
fi


# Login
alias \
  shutdown="sudo shutdown -P" \
  reboot="systemctl reboot" \
  poweroff="systemctl poweroff" \
  susp="systemctl suspend"

# Replace ls with Exa
if [ -x "$(command -v exa)" ]; then
  alias \
    ls="exa --all --color=always --group-directories-first" \
    ll="exa --long --header --group --classify --git" \
    tree="exa --tree"
fi

# Replace cat with Bat
command -v bat > /dev/null && alias cat="bat"

# Replace sudo with doas
if [ -x "$(command -v doas)" ]; then
  alias sudo="doas" \
    sv="doasedit"
else
  alias sudo="sudo -v; sudo " \
    sv="sudoedit"
fi

# System
alias \
  grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}" \
  diff="diff --color=auto" \
  du="du -ch" \
  v="$EDITOR" \
  cp="cp --reflink=auto -vari" \
  mv="mv -iv" \
  df="df -h" \
  free="free -h" \
  nb="newsboat" \
  mkdir="mkdir -pv" \
  rm="rm -vIr" \
  ex="extract" \
  o="open" \
  chmod="chmod --preserve-root" \
  ytdl="yt-dlp" \
  mpv-nvidia="prime-run mpv --hwdec=nvdec" \
  ssh="kitten ssh"



# git
alias \
  gs="git status" \
  ga="git add" \
  gc="git clone" \
  gcm="git commit -m" \
  gp="git push" \
  gpo="git push origin" \
  gtd="git tag --delete" \
  gtdr="git tag --delete origin" \
  gr="git branch -r" \
  gpl="git pull" \
  gplo="git pull origin" \
  gb="git branch " \
  gd="git diff" \
  gco="git checkout " \
  gl="git log" \
  gr="git remote" \
  grs="git remote show" \
  lg="lazygit"


# Dotfiles
alias dt="lazygit -g $DOTFILES -w $HOME"
dot() { git --git-dir="$DOTFILES" --work-tree="$HOME" "$@" ; }

alias myip="curl ipinfo.io/ip && echo"
