# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh
export UPDATE_ZSH_DAYS=2

PATH="$PATH:$HOME/scripts"
PATH="$PATH:$HOME/apps/bin"
PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
PATH="$PATH:$HOME/.composer/vendor/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
PATH="$PATH:$HOME/.mix/escripts"
PATH="$PATH:$HOME/dev/go/bin"
PATH="$PATH:$HOME/.dotnet"
PATH="$PATH:$HOME/.dotnet/tools"
PATH="$PATH:$HOME/.cargo/bin"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

if [ -x "$(command -v dotnet)" ]; then
	PATH="$PATH:/opt/dotnet/sdk/$(dotnet --version)/Sdks/"
fi

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
    cd "$(mktemp -d)" || return
}

dotnet() {
    if [[ $* == "restore" ]]; then
        command dotnet restore --configfile ~/.config/NuGet/NuGet.Config
    else
        command dotnet "$@"
    fi
}

today_log() {
	MY_DAY=$(date +%d)
	MY_MONTH=$(date +%m)
	MY_YEAR=$(date +%Y)

	LOG_PATH="$MY_YEAR/$MY_MONTH/$MY_DAY.md"

	PREFIX="$HOME/Nextcloud/Notes/Journal/"

	JOURNAL_PATH="$PREFIX$LOG_PATH"

	# Credits to https://stackoverflow.com/a/24666836/5571277
	mkdir -p "$(dirname "$JOURNAL_PATH")" || return; touch "$JOURNAL_PATH";

	micro "$JOURNAL_PATH"
}


TERM=xterm-256color
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"
# enable history
SAVEHIST=10000
HISTFILE=~/.zsh_history

ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

plugins=(docker nvm sudo zsh-autosuggestions zsh-better-npm-completion zsh-completions zsh-syntax-highlighting history-substring-search autoupdate)

autoload -U compinit && compinit

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
