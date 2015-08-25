art_dir=~/.dotfiles/art

alias ls="ls -G"
alias comp430_sql_connect="tsql -U adrice\\\\ssh2 -H classdb.ad.rice.edu -p 1433"
alias comp430_sql_exec="bsqldb -U adrice\\\\ssh2 -S classdb.ad.rice.edu:1433"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias gcc="gcc-4.9"
alias g++="g++-4.9"
alias c++="c++-4.9"

export TERM=xterm-256color

source /usr/local/etc/bash_completion.d/*

# SQL Server version
export TDSVER=8.0

export CLICOLOR=1

# Original colorscheme
#export LSCOLORS=GxFxCxDxBxegedabagaced

# Linux-Like colors
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

export EDITOR=vim

export PS1="\[\e[00;32m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[00;36m\]\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;35m\]\W\[\e[0m\]\[\e[00;37m\] > \[\e[0m\]"

cat $art_dir/eiffel.txt

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
