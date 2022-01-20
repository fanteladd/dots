setopt sharehistory		# Share history between all sessions.
setopt histexpiredupsfirst	# Expire a duplicate event first when trimming history.
setopt histignoredups		# Do not record an event that was just recorded.
setopt histignorealldups	# Delete an old record even if a new event is duplicate.
setopt histfindnodups	# Do not display a previously found event.
setopt histignorespace	# Do not record an event starting with space.
setopt histverify		# Do not execute inmediately upon history expansion.
setopt appendhistory
HISTFILE=~/.config/zsh/history
HISTSIZE=10000
SAVEHIST=10000
TIMEFMT="'$fg[green]%J$reset_color' time: $fg[blue]%*Es$reset_color, cpu: $fg[blue]%P$reset_color"
REPORTTIME=10

bindkey '^R' history-incremental-pattern-search-backward
