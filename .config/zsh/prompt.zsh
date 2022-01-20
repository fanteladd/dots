# Git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr 'S'
zstyle ':vcs_info:*' unstagedstr 'U'
zstyle ':vcs_info:git:*' formats '%B  %F{11}󰊤 %r %F{13} %b %F{2}%u %c'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

RPROMPT='$vcs_info_msg_0_'
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg_bold[blue]%}%d $(git_prompt_info)% %{$reset_color%}'

export PS1=$'%B%F{5}%~%(?.%F{3}.%F{1}) ${VIMODE} %F{reset}%b'
