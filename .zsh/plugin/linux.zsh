# load all of the config files in ~/.buildenv that end in .zsh
if [[ -d $HOME/.buildenv ]]; then
	for cfg_file ($HOME/.buildenv/*.zsh) source $cfg_file
fi	
