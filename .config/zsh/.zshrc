# Enable colors and change prompt:
autoload -Uz colors && colors
autoload -Uz promptinit; promptinit
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/prompt.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/prompt.zsh"

# Completion
autoload -Uz compinit
zmodload zsh/complist
compinit
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completion.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completion.zsh"

# Navigation:
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/navigation.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/navigation.zsh"

# History
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history.zsh"

# vi mode
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vimode.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vimode.zsh"

# bindings
bindkey -v
bindkey -M vicmd 'y' vi-yank-wlclip
bindkey '^H' backward-delete-word
bindkey "^xs" sudo-command-line
bindkey -M vicmd "^x2" toggleSingleString
bindkey '^x"' toggleDoubleString
bindkey '^x;' clearString

# Aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/alias.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/alias.zsh"

# Some functions
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh"

local SHARE="/usr/share"
# load skim completion and keybindings
[ -f "$SHARE/fzf/key-bindings.zsh" ] && source "$SHARE/fzf/key-bindings.zsh"
[ -f "$SHARE/fzf/completion.zsh" ] && source "$SHARE/fzf/completion.zsh"

# Plugins
local PLUGINS="$SHARE/zsh/plugins"
[ -f "$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "$PLUGINS/zsh-you-should-use/you-should-use.plugin.zsh" ] && source "$PLUGINS/zsh-you-should-use/you-should-use.plugin.zsh"
[ -f "$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
