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

path+=("$HOME/Scripts")
path+=("$HOME/.local/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.config/composer/vendor/bin/")
path+=("$BUN_INSTALL/bin")

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
    zgenom oh-my-zsh plugins/bgnotify
    zgenom oh-my-zsh plugins/git
    zgenom oh-my-zsh plugins/sudo
    zgenom oh-my-zsh plugins/colored-man-pages
    zgenom oh-my-zsh plugins/rsync
    zgenom oh-my-zsh plugins/nvm

    zgenom loadall <<EOPLUGINS
        zdharma-continuum/fast-syntax-highlighting
        zdharma-continuum/zsh-diff-so-fancy
      	zsh-users/zsh-history-substring-search
        clarketm/zsh-completions
        zsh-users/zsh-autosuggestions
        unixorn/warhol.plugin.zsh
        svenXY/timewarrior
        spwhitt/nix-zsh-completions
        jscutlery/nx-completion
        unixorn/prettyping
        agkozak/zsh-z
        MichaelAquilina/zsh-you-should-use
        spaceship-prompt/spaceship-prompt spaceship
EOPLUGINS
    zgenom save
fi
