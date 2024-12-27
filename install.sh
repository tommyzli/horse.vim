brew install fzf bat ripgrep the_silver_searcher perl universal-ctags
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf ~/horse.vim/.vimrc ~/.vimrc
vim +PlugInstall +qall
