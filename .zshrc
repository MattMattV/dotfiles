# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##############################
### Matthieu Vion's .zshrc ###
##############################

# Binaries installed with Cargo
export PATH=$PATH:$HOME/.cargo/bin

# Binaries from pip
export PATH=$PATH:$HOME/.local/bin

# Binaries from Ruby package manager, gem
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# https://github.com/zyedidia/micro to replace nano
EDITOR=micro

TERM=xterm-256color

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

SAVEHIST=10000
HISTFILE=~/.zsh_history
INC_APPEND_HISTORY=true

# As of v0.4.0, zsh-suggestions can be fetched asynchronously.
ZSH_AUTOSUGGEST_USE_ASYNC=true

# zsh-autosuggestions will first try to find a suggestion from the history, but, if it can't find a match, will find a suggestion from the completion engine.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# disabling zsh-autosuggestions when copy pasting large texts by example
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

bgnotify_threshold=4

function bgnotify_formatted() {
    ## $1=exit_status, $2=command, $3=elapsed_time
    notify-send.sh --icon=terminal --app-name='oh my zsh!' --hint=string:sound-name:complete "oh my zsh!" "'$2' ($3s) $3"
    #bgnotify "'$2' ($3s) $3";
}

plugins=(
    autoupdate
    bgnotify
    docker
    docker-compose
    dotenv
    git
    history-substring-search
    npm
    nvm
    sudo
    z
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)
autoload -U compinit && compinit

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
