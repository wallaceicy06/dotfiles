# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set terminal to 256 colors
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm pip)

# User configuration
export PATH="${HOME}/.local/bin:/usr/local/bin:/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

if [[ "$(uname)" == "Darwin" ]]; then
    # Mac-only commands here
    export PATH="${PATH}:/opt/homebrew/bin"
    export HOMEBREW_NO_ENV_HINTS=1
fi

source $ZSH/oh-my-zsh.sh

# Work specific zsh configuration
if [ -f "$HOME/.zshrc_work" ]; then
    source "$HOME/.zshrc_work"
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Open a Claude session in a new git worktree named <name> (used by the
# new-workspace command; see bin/new-workspace).
cw() { claude --worktree "$1" --name "${2:-$1}"; }

osc52copy() {
  printf "\033]52;c;$(printf '%s' "$1" | base64)\a"
}

# Clean up mouse reporting
alias mfix="printf '\e[?1000l\e[?1001l\e[?1002l\e[?1003l\e[?1006l\e[?1015l\e[?12h\e[0 q'"
