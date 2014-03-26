# autoload -U add-zsh-hook
autoload -Uz vcs_info

# # enable VCS systems you use
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*:prompt:*' check-for-changes true

setopt prompt_subst
autoload -U promptinit
promptinit

# Look at http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
# for mor options
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '[%b%|%a%c%u%]%f'
zstyle ':vcs_info:*' formats ':%b%c%u%f'

zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

user=`whoami`
if [[ "$user" == "root" ]]; then
	PROMPT='%F{1}[%n@%m%f $(sub_prompt)%F{4}%~$(git_color)${vcs_info_msg_0_}%f%F{1}]%f %{$reset_color%}'
else
	PROMPT='[%n@%m $(sub_prompt)%F{4}%~$(git_color)${vcs_info_msg_0_}%f] %{$reset_color%}'
fi

function git_color() {
	if [[ -n $(git status -s 2> /dev/null) ]]; then
		COLOR="%F{1}"
    else
        COLOR="%F{2}"
    fi
	echo "$COLOR"
}

function sub_prompt() {
	if [[ "$PROMPT_SUBSTR" != "" ]]; then
		RET="%F{13}$PROMPT_SUBSTR%f "
	else
		RET=""
	fi
	echo "$RET"
}
