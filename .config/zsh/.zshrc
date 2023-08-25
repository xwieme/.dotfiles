### ----- PATH -----
export PATH="/home/xander/miniconda3/bin:$PATH"

### ----- ZSH HOME -----
export ZSH=$HOME/.config/zsh

### ----- HISTORY CONFIG -----
export HISTFILE=$HOME/.cache/zsh/zsh_history 
export HISTSIZE=10000           # How many commands zsh will load to memory
export SAVEHIST=10000           # How many commands save to history file

setopt HIST_IGNORE_ALL_DUPS     # Do not save dublicates

### ----- ALIASES -----
alias ls='ls --color=auto'
alias ll='ls -la'
alias cp='cp -i'                # Confirm before overwritting

### ----- PLUGINS & THEMES -----
source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme

