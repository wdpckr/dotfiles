# config terminal
if [[ -z "$TERM" ]]; then
	export TERM=xterm-color
fi

# load all of the config files in ~/.buildenv that end in .zsh
for config_file ($HOME/.buildenv/*.zsh) source $config_file

# set default build environment if possible
if [[ -f $HOME/.buildenv/default ]]; then
	source $HOME/.buildenv/default
fi 

# load platform specific config files
PLATFORM=`uname -s`

if [[ "$PLATFORM" == "Darwin" ]]; then
	for config_file ($HOME/.zsh/plugin/darwin/*.zsh) source $config_file
fi 	
	
if [[ "$PLATFORM" == "Linux" ]]; then
	for config_file ($HOME/.zsh/plugin/linux/*.zsh) source $config_file
fi 	
