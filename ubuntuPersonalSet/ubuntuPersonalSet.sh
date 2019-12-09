#!/bin/bash

#Install the cscope software
function installSoftware()
{
    sudo apt-get install cscope
    sudo apt-get install ctags
    sudo apt-get install git
    sudo apt-get install vim
    sudo apt-get install ssh
    sudo apt-get install python-autopep8
    sudo apt-get install clang-format
    sudo apt-get install golang-1.9
    sudo apt-get install golang-go
    sudo apt-get install fcitx
    #go get -u mvdan.cc/sh/cmd/shfmt
}

#copy the default config file
function cpConfigFile()
{
    if [ ! -d $HOME"/Bin" ]; then
        echo "make -p ~/Bin."
        mkdir -p ~/Bin
    else
        echo "~/Bin is exist."
    fi

    cp ../vim/.vimrc ~/
    cp ../git/.gitmsg ~/
    cp ../scripts/personalCmd.sh ~/Bin/

    #add personal command to the .bashrc
    echo "source ~/Bin/personalCmd.sh" >> ~/.bashrc
}

#config the git
function gitConfig()
{
    git config --global color.ui true
    git config --global user.email "tuhaibo511@126.com"
    git config --global user.name "Haibo Tu"
    git config --global core.editor vim
    git config --global commit.template ~/.gitmsg
    git config --global push.default simple
    git config --global credential.helper store
}

function installVimPlug()
{
    if [ ! -d $HOME"/.vim/bundle/Vundle.vim" ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git \
            ~/.vim/bundle/Vundle.vim
    else
        echo "Vundle plugin is install."
    fi

    vim +BundleInstall +qall
}

installSoftware
gitConfig
cpConfigFile
installVimPlug
