# Standard and additional keybindings:
#   ctrl + u : clear line
#   ctrl + w : delete word backward
#   ctrl + a : move to beginning of line
#   ctrl + e : move to end of line (e for end)
#   ctrl + f : move to next word (f for forward)
#   ctrl + b : move to previous word (b for backward)
#   ctrl + d : delete char at current position (d for delete)
#   ctrl + k : delete from character to end of line

bindkey -e
bindkey '\ew' kill-region
bindkey -s '\el' "ls\n"
bindkey -s '\e.' "..\n"
bindkey '^r' history-incremental-search-backward		# <ctrl>-r
bindkey "^[[5~" up-line-or-history 					# page up
bindkey "^[[6~" down-line-or-history					# page down

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search						# up arrow
bindkey '^[[B' down-line-or-search					# down arrow
#bindkey "^[[A" history-search-backward
#bindkey "^[[B" history-search-forward

bindkey '^b' backward-word							# <ctrl>-b
bindkey '^f' forward-word							# <ctrl>-f
bindkey "^[[1;5C" forward-word						# <ctrl>-right arrow
bindkey "^[[1;5D" backward-word						# <ctrl>-left arrow
bindkey ' ' magic-space    							# also do history expansion on space
bindkey '^[[Z' reverse-menu-complete					# <shift>-<tab>

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char					# <delete>
bindkey "^[[3~" delete-char 							# <fn>-<delete> (mac)
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# ctrl-s : insert sudo at the start of the line
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey '^s' insert-sudo

# ctrl-x : insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^x' insert-last-command-output

# Ctrl+space : print Git/Svn status or list files with ls
vcs-status() {
  \print; zle accept-line;
  if [ -d .git ]; then
	git status --short 
  elif [ -d .svn ]; then
	svn status
  else
	l # use the "l" alias for ls
  fi
  zle accept-line;
}
zle -N vcs-status
bindkey '^ ' vcs-status
