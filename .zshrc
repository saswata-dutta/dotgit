
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

## shade mac tools
path+=('/opt/homebrew/Cellar/python@3.10/3.10.7/bin')
path+=('/opt/homebrew/Cellar/git/2.38.0/bin')

path+=('/Applications/Sublime Text.app/Contents/SharedSupport/bin')

#####

# set options for less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'


# Save history so we get auto suggestions
export HISTFILE=$HOME/.zsh_history
export HISTFILESIZE=1000
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
export HISTTIMEFORMAT="[%F %T] "


# zsh Options
setopt cdablevars                # jump to path vars from anywhere
setopt auto_cd                   # cd by typing directory name if it's not a command
setopt auto_list                 # automatically list choices on ambiguous completion
setopt auto_menu                 # automatically use menu completion
setopt always_to_end             # move cursor to end if word had one match
setopt hist_reduce_blanks        # remove superfluous blanks from history items
setopt correct                   # correct comands
setopt correct_all               # autocorrect commands args
setopt interactive_comments      # allow comments in interactive shells
setopt append_history            # sessions will append their history list to the history file, rather than replace it
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt extended_history          # Write the history file in the ':start:elapsed;command' format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups          # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups      # Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups         # Do not display a previously found event.
setopt hist_ignore_space         # Do not record an event starting with a space.
setopt hist_save_no_dups         # Do not write a duplicate event to the history file.
setopt hist_verify               # Do not execute immediately upon history expansion.
setopt hist_beep                 # Beep when accessing non-existent history.
setopt complete_in_word          # Complete from both ends of a word.
setopt path_dirs                 # Perform path search even on command names with slashes.
setopt globdots                  # ignore dot while matching hidden files
setopt noclobber                 # prevent clobbering files use '>!' to clobber file
unsetopt case_glob               # Case-insensitive matching

### comment if causing issues with some plugins
# setopt cshjunkiequotes           # illegal to leave off closing quotes


#####

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

##### prompt

eval "$(starship init zsh)"

### file browsing


# config for fzf and jumps
source ~/.zsh_fzf.sh
eval "$(zoxide init zsh)"

#####

# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'
zstyle ':completion:*:complete:(cd|pushd):*' group-name ''
zstyle ':completion:*:complete:(cd|pushd):*' format ' '


# Partial-word, and then substring completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# only for git
zstyle ':completion:*:*:git:*' fzf-search-display true
# or for everything
zstyle ':completion:*' fzf-search-display true

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

####

# Keybindings
#ref https://stackoverflow.com/questions/6205157/iterm-2-how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line
bindkey -e      # keep in emacs mode for Ctrl+<key> actions

# moves
# bindkey "^[^[[C" forward-word
# bindkey "^[^[[D" backward-word

# bindkey "^[[1;10D" beginning-of-line
# bindkey "^[[1;10C" end-of-line

# bindkey "^[U"     backward-kill-line
# bindkey "^X^_"    redo

# bindkey '^[[A'    history-substring-search-up
# bindkey '^[[B'    history-substring-search-down

#############
# Termcolor
export TERM=xterm-256color

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

########### alias

source ~/.aliases

#####

source /Users/sas/.config/broot/launcher/bash/br

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

