mv -f $HOME/.bashrc /tmp/
ln -s $HOME/src/dotfiles/bashrc $HOME/.bashrc
mv -f $HOME/.vim /tmp/
ln -s $HOME/src/dotfiles/vim $HOME/.vim
mv -f $HOME/.vimrc /tmp/
ln -s $HOME/src/dotfiles/vim/vimrc $HOME/.vimrc
mv -f $HOME/.gitconfig /tmp/
ln -s $HOME/src/dotfiles/git/gitconfig $HOME/.gitconfig
mv -f $HOME/.psqlrc /tmp/
ln -s $HOME/src/dotfiles/psqlrc $HOME/.psqlrc
mv -f $HOME/.tmux.conf /tmp/	
ln -s $HOME/src/dotfiles/tmux.conf $HOME/.tmux.conf

