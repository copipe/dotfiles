if [ -f ~/.bash_profile ]; then
    echo "~/.bash_profile exist --> mv ~/.bash_profile ~/.bash_profile.orig";
    mv ~/.bash_profile ~/.bash_profile.orig
fi
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

if [ -f ~/.vimrc ]; then
    echo "~/.vimrc exist --> mv ~/.vimrc ~/.vimrc.orig";
    mv ~/.vimrc ~/.vimrc.orig
fi
ln -s ~/dotfiles/.vimrc ~/.vimrc

if [ ! -d ~/.vim ]; then
    echo "creating ~/.vim";
    mkdir ~/.vim
fi

if [ ! -d ~/.vim/bundle ]; then
    echo "creating ~/.vim/bundle";
    mkdir ~/.vim/bundle
fi

git clone https://www.github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

if [ ! -d ~/.vim/colors ]; then
    echo "creating ~/.vim/colors";
    mkdir ~/.vim/colors
fi

git clone https://github.com/tomasr/molokai ~/.vim/molokai
mv ~/.vim/molokai/colors/molokai.vim ~/.vim/colors
rm -rf ~/.vim/molokai
