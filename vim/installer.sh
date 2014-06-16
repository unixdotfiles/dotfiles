if ! __isroot
then
    [ ! -d ~/.vim/bundle/vundle ] && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    mkdir -p ~/.vim/backup
    mkdir -p ~/.vim/undo
    mkdir -p ~/.vim/swap
    mkdir -p ~/.vim/viminfo
fi
