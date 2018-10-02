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

export EDITOR=nano

# automatically run "pipenv shell" if we enter a pipenv project subdirectory
# if opening a new terminal, preserve the source directory
# PROMPT_COMMAND='prompt'
# precmd() { eval "$PROMPT_COMMAND"; }
# function prompt()
# {
#     if [ ! $PIPENV_ACTIVE ]; then
#       if [ `pipenv --venv 2>/dev/null` ]; then
#         export PIPENV_INITPWD="$PWD"
#         pipenv shell
#       fi
#     elif [ "$PIPENV_INITPWD" ] ; then
#       cd "$PIPENV_INITPWD" || return 1
#       unset PIPENV_INITPWD
#     fi
# }

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

ZSH_THEME="spaceship"

SPACESHIP_CHAR_SYMBOL="\\uf061 "

SPACESHIP_GIT_SYMBOL="\\uf1d3 \\ue725 "

SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL=""

SPACESHIP_EXEC_TIME_PREFIX="\\uf64f "

SPACESHIP_PROMPT_ORDER=(
  time
  user
  dir
  host
  git
  package
  node
  ruby
  elixir
  golang
  php
  rust
  haskell
  julia
  docker
  aws
  venv
  conda
  pyenv
  dotnet
  ember
  kubecontext
  exec_time
  line_sep
  battery
  vi_mode
  jobs
  exit_code
  char
)

plugins=(docker ng sudo pass yarn zsh-autosuggestions zsh-syntax-highlighting zsh-better-npm-completion)

source $ZSH/oh-my-zsh.sh
