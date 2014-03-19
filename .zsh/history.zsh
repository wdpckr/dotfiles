HISTFILE=$HOME/.zsh/hist/zsh-`date +%Y-%W`.hist
HISTSIZE=10000
SAVEHIST=10000

if [ ! -f $HISTFILE ]
then
   LASTHIST=$HOME/.zsh/hist/`ls -1tr $HOME/.zsh/hist/ | tail -1`
   if [ -f $LASTHIST ]
   then
      tail -500 $LASTHIST > $HISTFILE
      echo "####### `date +%Y-%W-%w` : `date` #######" >> $HISTFILE
   fi
fi

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
setopt hist_save_by_copy
