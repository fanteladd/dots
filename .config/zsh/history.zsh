setopt hist_ignore_dups  # Collapse two consecutive idential commands.
setopt hist_find_no_dups  # Ignore duplicates when searching history.
setopt share_history  # Share across concurrent sessions (append immediately, read from files, add timestamps).
setopt hist_ignore_space  # Lines that begin with space are not recorded.
setopt hist_verify  # Don't auto-execute selected history entry.
setopt hist_ignore_all_dups  # If a history entry would be duplicate, delete older copies.
HISTFILE=~/.config/zsh/history
SAVEHIST=100000 # Max entries saved to file.
HISTSIZE=100000 # Max entires for in-memory history.
TIMEFMT="'$fg[green]%J$reset_color' time: $fg[blue]%*Es$reset_color, cpu: $fg[blue]%P$reset_color"
REPORTTIME=10

bindkey '^R' history-incremental-pattern-search-backward
