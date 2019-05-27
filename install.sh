#!/bin/bash

echo "==> running dotfiles install script"

BASE=$HOME/.dotfiles

if [ ! -d "$BASE" ]; then
    echo "==> cloning git repository"
    git clone git@github.com:sundowndev/dotfiles.git $BASE
else
    echo "==> dotfiles already installed"
    echo "==> running git pull origin master"
    cd $BASE
    git pull origin master
fi

# shell related dotfiles
ln -fs ${BASE}/bashrc ${HOME}/.bashrc
ln -fs ${BASE}/bash_profile ${HOME}/.bash_profile
ln -fs ${BASE}/bash_aliases ${HOME}/.bash_aliases
ln -fs ${BASE}/zshrc ${HOME}/.zshrc
ln -fs ${BASE}/gitignore ${HOME}/.gitignore

if [ -f "${HOME}/.hyper.js" ]; then
    ln -fs ${BASE}/hyper.js ${HOME}/.hyper.js
fi

# VSCode or VSCodium
if [ -d "${HOME}/.config/Code/User" ]; then
    ln -fs ${BASE}/vscode-settings.json ${HOME}/.config/Code/User/settings.json
elif [ -d "${HOME}/.config/VSCodium/User" ]; then
    ln -fs ${BASE}/vscode-settings.json ${HOME}/.config/VSCodium/User/settings.json
fi

# Git user config
git config --global user.email "raphael@crvx.fr"
git config --global user.name "sundowndev"

# vim
#mkdir -p ~/.vim/autoload
#curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim
#mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
#ln -sf $BASE/vimrc ~/.vimrc
#vim +PlugInstall +qall

echo "==> script executed"
