# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export LANG=fr_FR.UTF-8
export LC_CTYPE=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="bureau"
ZSH_THEME="random"
# aliases
alias zshconfig="subl ~/.zshrc"
alias bower='noglob bower'
alias bowerlist='bower list --path'
# npm alias
alias npmui='npm-check-updates -u && sudo npm install'

alias ctcmd='export HISTTIMEFORMAT="%d/%m/%y %T"; history | grep -c `date "+%d/%m/%y"`'

# git alias
alias gst='git status'
alias gct='git commit'
alias ga='git add'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Change this value to set how frequently ZSH updates¬
#export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

export HISTCONTROL=ignoredups

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/local/sbin

[ -s "/Users/GDO/.nvm/nvm.sh" ] && . "/Users/GDO/.nvm/nvm.sh" # This loads nvm

export HISTCONTROL=ignoredups

# Jump to folder
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
function _completemarks {
  reply=($(ls $MARKPATH))
}
compctl -K _completemarks jump
compctl -K _completemarks unmark

## automaticaly right use node version when .nvmrc is detected
nvmautouse() {
    if [ -r .nvmrc ]; then
        nvm use
    fi
}

cd() {
    builtin cd "$@"
    nvmautouse
}
## fix duplicated items in 'open with ...'
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
source ~/.fzf.zsh
source ~/.profile
