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

# Vi mode
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vimode.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vimode.zsh"

# Bindings
bindkey -v
bindkey -M vicmd 'y' vi-yank-wlclip
bindkey '^H' backward-delete-word
bindkey "^xs" sudo-command-line
bindkey -M vicmd "^x2" toggleSingleString
bindkey '^x"' toggleDoubleString
bindkey '^x;' clearString
zle -N history-substring-search-up
zle -N history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/alias.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/alias.zsh"

# Functions
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh"

local SHARE="/usr/share"
# load fzf completion and keybindings
[ -f "$SHARE/fzf/key-bindings.zsh" ] && source "$SHARE/fzf/key-bindings.zsh"
[ -f "$SHARE/fzf/completion.zsh" ] && source "$SHARE/fzf/completion.zsh"

# Plugins
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
local PLUGINS="$SHARE/zsh/plugins"
[ -f "$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "$PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh" ] && source "$PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Plugins settings
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=5,fg=#24283b,bold"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=1,fg=#24283b,bold"

export ZSH_AUTOSUGGEST_USE_ASYNC=1
