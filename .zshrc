# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#############################################################################
# Prefer Lang and use UTF-8
#############################################################################

export LC_ALL="fr_FR.UTF-8"
export LANG="fr_FR"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="bureau"
ZSH_THEME="random"


#############################################################################
# aliases
#############################################################################
alias zshconfig="subl ~/.zshrc"
alias drives="df -h" # list all drives
alias listen="sudo lsof -i -P | grep -i \"listen\"" # listen on ports

alias preview="open -a '$PREVIEW'"
alias xcode="open -a '/Developer/Applications/Xcode.app'"
alias safari="open -a safari"
alias firefox="open -a firefox"
alias chrome="open -a google\ chrome"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# File size
alias fs="stat -f \"%z bytes\""

## fix duplicated items in 'open with ...'
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

#############################################################################
# npm aliases
#############################################################################
alias npmui='npm-check-updates -u && sudo npm install'
alias ctcmd='export HISTTIMEFORMAT="%d/%m/%y %T"; history | grep -c `date "+%d/%m/%y"`'

#############################################################################
# git aliases
#############################################################################
alias git-status='git status'
alias git-commit='git commit'
alias git-add='git add'
alias git-push='git push'
alias rm-stash='git stash clear'

#############################################################################
# grunt/gulp aliases
#############################################################################
alias grunt-start='grunt start'
alias grunt-server='grunt server'
alias grunt-build='grunt build'

#############################################################################
# bower aliases
#############################################################################
alias bower='noglob bower'
alias bowerlist='bower list --path'

#############################################################################
# nginx aliases
#############################################################################

alias nginx-start="sudo nginx"
alias nginx-restart="sudo nginx -s reload"
alias nginx-stop="sudo nginx -s stop"

#############################################################################
# php-fpm aliases
#############################################################################

alias php-start="sudo launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php55.plist"
alias php-stop="sudo launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php55.plist"
alias php-restart="php-stop && php-start"

#############################################################################
# mongo aliases
#############################################################################

alias mongo-start="sudo launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
alias mongo-stop="sudo launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
alias mongo-restart="mongo-stop && mongo-start"

#############################################################################
# mysql aliases
#############################################################################

alias mysql-start="sudo mysql.server start"
alias mysql-stop="sudo mysql.server stop"
alias mysql-restart="mysql-stop && mysql-start"

#############################################################################
# zsh config
#############################################################################

export UPDATE_ZSH_DAYS=3

COMPLETION_WAITING_DOTS="true"

export HISTCONTROL=ignoredups

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
# Customize to your needs...
# default path
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/local/sbin

#############################################################################
# Jump to folder
#############################################################################
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


#############################################################################
# nvm config
#############################################################################

##[ -s "/Users/GDO/.nvm/nvm.sh" ] && . "/Users/GDO/.nvm/nvm.sh" # This loads nvm

## automaticaly right use node version when .nvmrc is detected
##nvmautouse() {
##    if [ -r .nvmrc ]; then
##        nvm use
##    fi
##}
##
##cd() {
##    builtin cd "$@"
##    nvmautouse
##}
