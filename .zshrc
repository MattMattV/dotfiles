export ZSH=~/.oh-my-zsh

PATH=$PATH:$HOME/scripts
PATH=$PATH:$HOME/apps/bin
PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin
PATH=$PATH:$HOME/.config/composer/vendor/bin
PATH=$PATH:$HOME/.local/bin

export GOPATH=$HOME/dev/go
export GOBIN=$HOME/dev/go/bin

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"'/keeagent.socket'

LANG=fr_FR.UTF-8
LANGUAGE=fr_FR.UTF-8

git_tsi () {
    git config --global user.signingkey 315FA0B33C21C72C
}

git_perso () {
    git config --global user.signingkey E1B0AC35CD8ACE99
}

# credits to https://unix.stackexchange.com/a/87909
free_ram () {
    free -h
    sync
    sudo sysctl -w vm.drop_caches=3
    free -h
}

cdtemp () {
    cd $(mktemp -d)
}

TERM=xterm-256color
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"
# enable history
SAVEHIST=10000
HISTFILE=~/.zsh_history

ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(archlinux composer docker ng  pass sudo yarn zsh-autosuggestions zsh-syntax-highlighting zsh-better-npm-completion)
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{255}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{255}\u2570%F{255}\uF460%F{250}\uF460%F{245}\uF460%f "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir_writable dir ip virtualenv vcs status command_execution_time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1

source $ZSH/oh-my-zsh.sh