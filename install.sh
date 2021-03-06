#!/bin/bash
##############################################################################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
##############################################################################

##### Constants
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
CYAN='\033[0;36m'

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

##### Variables

dir=~/.dotfiles              # dotfiles directory
olddir=~/.dotfiles_old       # old dotfiles backup directory

##### Functions
function program_is_installed {
    type $1 > /dev/null 2>&1
}

# list of files/folders to symlink in home dir
files=(vimrc 
       gvimrc 
       bashrc 
       tmux.conf 
       zshrc
       editorconfig
       rtorrent.rc)

#####

# check preconditions
if ! program_is_installed "git"; then
    echo -e "${RED}${BOLD}ERROR:${NORMAL}${NC} git must be installed."
    exit 1
fi
if ! program_is_installed "vim"; then
    echo -e "${RED}${BOLD}ERROR:${NORMAL}${NC} vim must be installed."
    exit 1
fi
if ! program_is_installed "zsh"; then
    echo -e "${RED}${BOLD}ERROR:${NORMAL}${NC} zsh must be installed."
    exit 1
fi

echo ""
echo "************************************************************************"
echo "*                                                                      *"
echo "*                      Dotfiles Bootstrap Script                       *"
echo "*                                                                      *"
echo "************************************************************************"

sleep 3

# install oh-my-zsh
echo -e "\n${BOLD}Installing Oh-My-Zsh...${NORMAL}"
sh -c "$(curl --progress-bar -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# create dotfiles_old in homedir
if ! [ -d $olddir ]; then
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks
echo -e "\n${BOLD}Backing up existing dotfiles...${NORMAL}"
existing_dotfile_count=0
for file in ${files[*]}; do
    if [ -f ~/.$file ] && ! [ -L ~/.$file ]; then
        echo ".$file -> ~/.dotfiles_old/$file"
        mv ~/.$file ~/.dotfiles_old/$file
        let existing_dotfile_count=existing_dotfile_count+1
    fi
done
if [ $existing_dotfile_count -eq 0 ]; then
    echo -e "${BROWN}No pre-existing dotfiles to back up.${NC}"
fi

echo -e "\n${BOLD}Creating missing symbolic links...${NORMAL}"
missing_symlink_count=0
for file in ${files[*]}; do
    if ! [ -L ~/.$file ]; then
        echo ".$file -> $dir/$file"
        ln -s $dir/$file ~/.$file
        let missing_symlink_count=missing_symlink_count+1
    fi
done
if [ $missing_symlink_count -eq 0 ]; then
    echo -e "${BROWN}No missing symlinks to link.${NC}"
fi

# if vim-plug is not installed, then install it.
echo -e "\n${BOLD}Installing vim-plug...${NORMAL}"
if ! [ -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo -e "${BROWN}You already have vim-plug installed.${NC}"
fi

# Install Vim plugins
echo -e "\n${BOLD}Installing vim-plug plugins...${NORMAL} ${CYAN}(you may need to press ENTER)${NC}"
sleep 1
vim -i NONE -c PlugUpdate -c quitall

echo -e "\n${GREEN}${BOLD}SUCCESS:${NORMAL}${NC} Completed bootstrapping. Cowboy up!"
