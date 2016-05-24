git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/tommyzli/horse.vim.git
ln -sf ~/horse.vim/.vimrc ~/.vimrc
ln -sf ~/horse.vim/.vimrc.bundles ~/.vimrc.bundles
vim +PluginInstall +qall
