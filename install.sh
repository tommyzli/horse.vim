git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:tommyzli/horse.vim.git
ln -sf ~/horse.vim/.vimrc ~/.vimrc
ln -sf ~/horse.vim/.vimrc.bundles ~/.vimrc.bundles
vim +PluginInstall +qall
