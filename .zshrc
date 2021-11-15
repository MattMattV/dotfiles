autoload -U compinit
setopt promptsubst
autoload -U promptinit; promptinit

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

SAVEHIST=10000
HISTFILE=~/.zsh_history
export HIST_STAMPS="mm/dd/yyyy"
setopt inc_append_history
setopt share_history
setopt extended_history
setopt hist_ignore_space

# bgnotify custom function
function bgnotify_formatted() {
    ## $1=exit_status, $2=command, $3=elapsed_time
    notify-send.sh --icon=terminal --app-name='oh my zsh!' --hint=string:sound-name:complete "oh my zsh!" "'$2' ($3s) $3"
    #bgnotify "'$2' ($3s) $3";
}

export NVM_LAZY_LOAD=true

source ~/.zinit/bin/zinit.zsh

zinit ice wait'!'
zinit snippet OMZP::nvm
zinit ice wait'!'
zinit snippet OMZP::sudo
zinit ice wait'!'
zinit snippet OMZP::bgnotify

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

zinit ice blockf
zinit light zsh-users/zsh-completions

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# ogham/exa, replacement for ls
zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa" pick"bin/exa"
zinit light ogham/exa

zinit ice as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit ice as"program" cp"wd.sh -> wd" mv"_wd.sh -> _wd" \
    atpull'!git reset --hard' pick"wd"
zinit light mfaerevaag/wd

zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit load zdharma-continuum/zsh-diff-so-fancy

zinit ice wait"0" lucid
zinit load lukechilds/zsh-nvm

zinit wait lucid for \
 atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# Automatically refresh completions
zstyle ':completion:*' rehash true
# Highlight currently selected tab completion
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _expand _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# zstyle ':completion:*' group-name '' # group results by category