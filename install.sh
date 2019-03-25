#!/bin/bash

BASE=$HOME/.dotfiles

if [ ! -d "$BASE" ]; then
    git clone https://github.com/sundowndev/dotfiles $BASE
else
    echo "dotfiles already installed"
fi

# links
ln -fs ${BASE}/bashrc ${HOME}/.bashrc
ln -fs ${BASE}/bash_profile ${HOME}/.bash_profile
ln -fs ${BASE}/bash_aliases ${HOME}/.bash_aliases
ln -fs ${BASE}/zshrc ${HOME}/.zshrc
ln -fs ${BASE}/gitignore ${HOME}/.gitignore

# mac
if [ -z "$(which brew)" ]; then
    echo "detected mac os"
    #brew install git vim wget fzf tree tmux graphviz transmission bash-completion reattach-to-user-namespace
    #brew cask install virtualbox virtualbox-extension-pack vagrant flux spectacle iterm2
    # [ -f /usr/local/etc/bash_completion.d/git-completion.bash ] || \
    #     wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -P \
    #     /usr/local/etc/bash_completion.d/
else
# linux
    echo "detected linux os"
    #sudo apt install -y git vim tmux wget transmission virtualbox virtualbox-ext-pack
    #git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    #sudo -y ~/.fzf/install
    # [ -f /etc/bash_completion.d/git-completion.bash ] || \
    #     sudo wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -P \
    #     /etc/bash_completion.d/
fi

git config --global user.email "raphael@crvx.fr"
git config --global user.name "sundowndev"

# vim
#mkdir -p ~/.vim/autoload
#curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim
#mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
#ln -sf $BASE/vimrc ~/.vimrc

#vim +PlugInstall +qall
