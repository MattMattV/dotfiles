#!/bin/zsh

export ZSH=~/.oh-my-zsh

PATH="$PATH:$HOME/scripts"
PATH="$PATH:$HOME/apps/bin"
PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
PATH="$PATH:$HOME/.config/composer/vendor/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
PATH="$PATH:$HOME/.mix/escripts"
PATH="$PATH:$HOME/dev/go/bin"
PATH="$PATH:$HOME/.dotnet/tools"
PATH="$PATH:/opt/dotnet/sdk/2.2.105/Sdks/"
PATH="$PATH:$HOME/.npm-global/bin"

export DOTNET_ROOT=/opt/dotnet/
DOTNET_CLI_TELEMETRY_OPTOUT=1

export GOPATH=$HOME/dev/go
export GOBIN=$HOME/dev/go/bin

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

LANG=fr_FR.UTF-8
LANGUAGE=fr_FR.UTF-8


git_tsi () {
    git config user.signingkey 315FA0B33C21C72C
}

git_perso () {
    git config user.signingkey E1B0AC35CD8ACE99
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

dotnet() {
    if [[ $@ == "restore" ]]; then
        command dotnet restore --configfile ~/.config/NuGet/NuGet.Config
    else
        command dotnet "$@"
    fi
}

TERM=xterm-256color
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"
# enable history
SAVEHIST=10000
HISTFILE=~/.zsh_history

ZSH_THEME="spaceship"

SPACESHIP_CHAR_SYMBOL="\\uf061 "

SPACESHIP_GIT_SYMBOL="\\uf1d3 \\ue725 "

SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL=""

SPACESHIP_EXEC_TIME_PREFIX="\\uf64f "

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

plugins=(aws docker nvm sudo kubectl zsh-autosuggestions zsh-better-npm-completion zsh-completions zsh-syntax-highlighting history-substring-search)

autoload -U compinit && compinit

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

source $ZSH/oh-my-zsh.sh
