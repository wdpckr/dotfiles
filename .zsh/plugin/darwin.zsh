alias mou="open /Applications/Mou.app"

# show manpages in preview
pman()
{
	man -t "$@" | open -f -a /Applications/Preview.app/
}

# open a folder in forklift via 'fl <folder>'
source ~/.zsh/plugin/forklift.zsh

# path enhancements
export -U PATH=$PATH:~/bin/iptwireshark:~/bombardier/bin

# use zsh-completions, install via brew
fpath=(/usr/local/share/zsh-completions $fpath)
