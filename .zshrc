# load all of the config files in ~/.zsh that end in .zsh
for config_file ($HOME/.zsh/*.zsh) source $config_file

autoload -U compinit
compinit -i
