if [[ -z "$TERM" ]]; then
	export TERM=xterm-color
fi

if [[ -f $HOME/.buildenv/default ]]; then
	source $HOME/.buildenv/default
fi 

PLATFORM=`uname -s`

if [[ "$PLATFORM" == "Darwin" ]]; then
	if [[ -f $HOME/.zsh/plugin/darwin.zsh ]]; then
		source $HOME/.zsh/plugin/darwin.zsh
	fi
fi 	
	
if [[ "$PLATFORM" == "Linux" ]]; then
	if [[ -f $HOME/.zsh/plugin/linux.zsh ]]; then
		source $HOME/.zsh/plugin/linux.zsh
	fi
fi 	
