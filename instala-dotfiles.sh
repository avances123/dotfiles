rm -f $HOME/.bashrc
ln -s $HOME/src/dotfiles/bashrc $HOME/.bashrc
rm -rf $HOME/.vim
ln -s $HOME/src/dotfiles/vim $HOME/.vim
rm -f $HOME/.vimrc
ln -s $HOME/src/dotfiles/vim/vimrc $HOME/.vimrc
rm -f $HOME/.gitconfig
ln -s $HOME/src/dotfiles/gitconfig $HOME/.gitconfig
rm -f $HOME/.psqlrc
ln -s $HOME/src/dotfiles/psqlrc $HOME/.psqlrc

