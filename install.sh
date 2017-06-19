git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tommyzli/horse.vim.git
ln -sf ~/horse.vim/.vimrc ~/.vimrc
ln -sf ~/horse.vim/.vimrc.bundles ~/.vimrc.bundles
vim +PluginInstall +qall
