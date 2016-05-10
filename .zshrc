# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# PHP

alias test="bin/phpunit -c tests/phpunit.xml"
alias testwc="bin/phpunit -c tests/phpunit.xml --coverage-html ./coverage"

#ssh
alias devbox="ssh root@jake.dev.enflick.com"

#Utilities
enum() {
  phonenum=${*}
  addr=`python -c 'import sys; num = filter(str.isdigit, "".join(sys.argv[1:])); \
    num = num if len(num) != 10 else "1" + num; print ".".join(num[::-1])' ${phonenum}`
    ssh -q -t mmsc3.enflick.com "dig ${addr}.spidname.enflick.e164.arpa TXT"
}

alias rmxdebug="brew uninstall php55-xdebug; rm /usr/local/etc/php/5.5/conf.d/ext-xdebug.ini"

alias timestamp="date +%s"

# Git
alias showconflicts="git diff --name-only --diff-filter=U"
alias dmerged="git branch --merged develop | grep -v master | grep -v develop | xargs git branch -d"
export PATH="/usr/local/sbin:$PATH"

# PHP installation stuff
#alias rmxdebug="brew uninstall php55-xdebug;rm /usr/local/etc/php/5.5/conf.d/ext-xdebug.ini;"
#alias installxdebug="brew install php55-xdebug;"

function coverageoff {
    mv /usr/local/etc/php/5.5/conf.d/ext-xdebug.ini /usr/local/etc/php/5.5/conf.d/ext-xdebug.ini.bk
}

function coverageon {
    mv /usr/local/etc/php/5.5/conf.d/ext-xdebug.ini.bk /usr/local/etc/php/5.5/conf.d/ext-xdebug.ini
}

# Api Docs stuff
# Start Aglio Service
function dsstart {
    nohup aglio -i $1 --theme-variables slate --server --port 9001 &> /var/log/nohup.out  &
}

function dsstop {
    pkill -9 -f aglio
}

function setprecommit {
    ln -sf ../../tools/hooks/pre-commit .git/hooks/pre-commit
}

function showapi {
    csshx api1 --screen 1
    csshx api2 --screen 3
    csshx api3 --screen 2
}

function showmc {
    git diff --name-only --diff-filter=U
}
