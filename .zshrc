GITSTATUS_LOG_LEVEL=DEBUG

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Correct spelling for commands
setopt correct

# turn off the infernal correctall for filenames
unsetopt correctall

# history tweaking
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt INC_APPEND_HISTORY
unsetopt HIST_BEEP
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

export EDITOR=micro

# bun
export BUN_INSTALL="$HOME/.bun"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

export ANDROID_HOME=$HOME/Android/Sdk

path=('$HOME/.rye/shims' $path)

path+=("$HOME/Scripts")
path+=("$HOME/.local/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.config/composer/vendor/bin/")
path+=("$BUN_INSTALL/bin")
path+=("$ANDROID_HOME/emulator")
path+=("$ANDROID_HOME/platform-tools")

export PATH

# Add some completions settings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# zstyle ':completion:*:*:docker:*' option-stacking yes
# zstyle ':completion:*:*:docker-*:*' option-stacking yes

zstyle ':omz:plugins:nvm' autoload yes

setopt ALWAYS_TO_END     # Move cursor to the end of a completed word.
setopt AUTO_LIST         # Automatically list choices on ambiguous completion.
setopt AUTO_MENU         # Show completion menu on a successive tab press.
setopt AUTO_PARAM_SLASH  # If completed parameter is a directory, add a trailing slash.
setopt COMPLETE_IN_WORD  # Complete from both ends of a word.

# Invalidate config on .zshrc change
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

# oh-my-zsh/bgnotify options
bgnotify_threshold=2


if [ ! -d "${HOME}/.zgenom" ]
then
	git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

source "${HOME}/.zgenom/zgenom.zsh"

zgenom autoupdate 1

if ! zgenom saved; then
    echo "Creating a zgenom save"

    zgenom oh-my-zsh
    zgenom oh-my-zsh plugins/aws
    zgenom oh-my-zsh plugins/bgnotify
    # zgenom oh-my-zsh plugins/composer
    # zgenom oh-my-zsh plugins/docker
    # zgenom oh-my-zsh plugins/docker-compose
    zgenom oh-my-zsh plugins/sudo
    zgenom oh-my-zsh plugins/colored-man-pages
    zgenom oh-my-zsh plugins/systemd
    zgenom oh-my-zsh plugins/nvm

    zgenom loadall <<EOPLUGINS
        zdharma-continuum/fast-syntax-highlighting
		# marlonrichert/zsh-autocomplete trop capricieux
      	# zsh-users/zsh-history-substring-search
        clarketm/zsh-completions
        zsh-users/zsh-autosuggestions
        unixorn/warhol.plugin.zsh
        unixorn/prettyping
        agkozak/zsh-z
        romkatv/powerlevel10k powerlevel10k


        # svenXY/timewarrior
        # spwhitt/nix-zsh-completions
        # jscutlery/nx-completion
        # MichaelAquilina/zsh-you-should-use
        # spaceship-prompt/spaceship-prompt spaceship
EOPLUGINS
    zgenom save
fi

# zsh-users/zsh-autosuggestions options
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept

# bun completions
[ -s "/home/matthieu/.bun/_bun" ] && source "/home/matthieu/.bun/_bun"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f "~/.rye/env" ]] || source "~/.rye/env"

alias ls="eza -l -a --icons -F --hyperlink"
