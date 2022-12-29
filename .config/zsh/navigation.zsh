setopt auto_cd			# Go to folder path without using cd.
setopt auto_pushd		# Push the old directory onto the stack on cd.
setopt pushd_ignore_dups	# Do not store duplicates in the stack.
setopt pushd_silent		# Do not print the directory stack after pushd or popd
alias d='dirs -v'

goback() {
  builtin cd -P ../
}
zle -N goback
bindkey "^N" goback

for index ({1..9}) alias "$index"="cd +${index}"; unset index
