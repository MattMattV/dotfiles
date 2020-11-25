##############################
### Matthieu Vion's .zshrc ###
##############################

# Binaries installed with Cargo
export PATH=$PATH:$HOME/.cargo/bin

# Binaries from pip
export PATH=$PATH:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

bgnotify_threshold=4

function bgnotify_formatted {
    ## $1=exit_status, $2=command, $3=elapsed_time
    notify-send.sh --icon=terminal --app-name='oh my zsh!' --hint=string:sound-name:complete "oh my zsh!" "'$2' ($3s) $3"
    #bgnotify "'$2' ($3s) $3";
}

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    bgnotify
    cargo
    docker
    docker-compose
    dotenv
    git
    npm
    nvm
    sudo
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
