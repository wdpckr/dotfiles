alias mou="open /Applications/Mou.app"

# show manpages in preview
pman()
{
	man -t "$@" | open -f -a /Applications/Preview.app/
}

# path enhancements
export -U PATH=$PATH:~/bin/iptwireshark:~/bombardier/bin
export -U PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin

# use zsh-completions, install via brew
fpath=(/usr/local/share/zsh-completions $fpath)

# vagrant config
export VAGRANT_DEFAULT_PROVIDER='virtualbox'