export KEYTIMEOUT=1
bindkey "^?" backward-delete-char # Fix backspace bug when switching modes

# Change cursor shape for different vi modes.
cursor_mode() {
    VIMODE='󰁕 '
    cursor_block='\e[2 q'
    cursor_beam='\e[4 q'

    function zle-keymap-select {
      VIMODE="${${KEYMAP/vicmd/󰁕 }/(main|viins)/󰁕 }"
      if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne $cursor_block
      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne $cursor_beam
      fi
      zle reset-prompt
    }

    zle-line-init() {
        zle -K viins
        echo -ne "$cursor_beam"
    }

    # Use beam shape cursor for each new prompt.
    preexec() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
    zle -N preexec
}

cursor_mode

# Edit line in vim with v in normal mode:
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^v" edit-command-line
