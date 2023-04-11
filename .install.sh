#!/bin/bash
############################
# ./install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles,also some powerful tools for myself
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=$(ls "$dir")    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
"cd $dir || exit"
echo "done"

################################
# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
################################
for file in $files; do
    if [[ -f ~/."$file" || -d ~/."$file" ]]; then
        echo "Moving .$file from ~ to $olddir"
        mv ~/."$file" ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in ~."
    ln -sf $dir/"$file" ~/."$file"
done
# delete the REDEME.md symlink
if [[ -f ~/.README.md ]]; then
    echo "Delete .README.md symlink"
    rm ~/.README.md
fi

###################################
#     install powerful tools
###################################
# install zsh and zplug
install_zsh_zplug () {
# Test to see if zshell is installed.  If it is:
if [[ -f /bin/zsh || -f /usr/bin/zsh ]]; then
    if [[ ! -d ~/.zplug ]]; then
	    sudo apt install zplug
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo "$SHELL") == $(which zsh) ]]; then
        chsh -s "$(which zsh)"
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh_zplug
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt install zsh
            install_zsh_zplug
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh_zplug

# install tmux
install_tmux () {
# Test to see if tmux is installed:
if [[ ! -f /bin/tmux || ! -f /usr/bin/tmux ]]; then
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install tmux and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install tmux 
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt install tmux 
        fi
    # If the platform is OS X, tell the user to install tmux :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install tmux, then re-run this script!"
        exit
    fi
fi 
}

install_tmux

# install fzf
install_fzf (){
    if [[ ! -d ~/.fzf ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    fi
}

install_fzf


# install tldr
install_tldr () {
# Test to see if tldr is installed:
if [[ ! -f /bin/tldr || ! -f /usr/bin/tldr ]]; then
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install tldr and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install tldr 
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt install tldr 
        fi
    # If the platform is OS X, tell the user to install tldr :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install tldr, then re-run this script!"
        exit
    fi
fi 
}

install_tldr

# install vim
install_vim () {
# Test to see if vim is installed:
if [[ ! -f /bin/vim || ! -f /usr/bin/vim ]]; then
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install vim and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install vim 
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt install vim 
        fi
    # If the platform is OS X, tell the user to install vim :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install vim, then re-run this script!"
        exit
    fi
fi 
}

install_vim

## use vim plug to debugger ,so doesn't need shellcheck anymore
## install shellcheck
#install_shellcheck () {
## Test to see if shellcheck is installed:
#if [[ ! -f /bin/shellcheck || ! -f /usr/bin/shellcheck ]]; then
#    platform=$(uname);
#    # If the platform is Linux, try an apt-get to install shellcheck and then recurse
#    if [[ $platform == 'Linux' ]]; then
#        if [[ -f /etc/redhat-release ]]; then
#            sudo yum install shellcheck 
#        fi
#        if [[ -f /etc/debian_version ]]; then
#            sudo apt install shellcheck 
#        fi
#    # If the platform is OS X, tell the user to install shellcheck :)
#    elif [[ $platform == 'Darwin' ]]; then
#        echo "Please install shellcheck, then re-run this script!"
#        exit
#    fi
#fi 
#}
#
#install_shellcheck
