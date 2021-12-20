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

# Add some completions settings
setopt ALWAYS_TO_END     # Move cursor to the end of a completed word.
setopt AUTO_LIST         # Automatically list choices on ambiguous completion.
setopt AUTO_MENU         # Show completion menu on a successive tab press.
setopt AUTO_PARAM_SLASH  # If completed parameter is a directory, add a trailing slash.
setopt COMPLETE_IN_WORD  # Complete from both ends of a word.
unsetopt MENU_COMPLETE   # Do not autoselect the first completion entry.

if [ ! -d "${HOME}/.zgenom" ]
then
	git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

source "${HOME}/.zgenom/zgenom.zsh"

zgenom autoupdate 1

if ! zgenom saved; then
    echo "Creating a zgenom save"

    zgenom ohmyzsh
    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/sudo
    zgenom oh-my-zsh plugins/colored-man-pages
    zgenom oh-my-zsh plugins/rsync

    zgenom loadall <<EOPLUGINS
        zsh-users/zsh-syntax-highlighting
      	zsh-users/zsh-history-substring-search
        zsh-users/zsh-completions src
        zsh-users/zsh-autosuggestions
        unixorn/warhol.plugin.zsh
        sindresorhus/pure
EOPLUGINS

    zgenom apply
fi

autoload -U promptinit; promptinit
prompt pure
