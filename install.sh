#!/bin/bash

BASE=$HOME/.dotfiles

if [ ! -d "$BASE" ]; then
    git clone git@github.com:sundowndev/dotfiles.git $BASE
else
    echo "dotfiles already installed"
fi

# links
ln -fs ${BASE}/bashrc ${HOME}/.bashrc
ln -fs ${BASE}/bash_profile ${HOME}/.bash_profile
ln -fs ${BASE}/bash_aliases ${HOME}/.bash_aliases
ln -fs ${BASE}/zshrc ${HOME}/.zshrc
ln -fs ${BASE}/gitignore ${HOME}/.gitignore

git config --global user.email "raphael@crvx.fr"
git config --global user.name "sundowndev"

# vim
#mkdir -p ~/.vim/autoload
#curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim
#mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
#ln -sf $BASE/vimrc ~/.vimrc

#vim +PlugInstall +qall
