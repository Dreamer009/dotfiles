## Quick Start

1. Download a Vim IDE (optional)

   Recommendations:

   a. [Vimr](http://vimr.org/)

   b. [MacVim](https://code.google.com/p/macvim/)

      install via: `brew install macvim`

      Note: MacVim doesn't come with a file browser, so might want to add [NERDTree](https://github.com/scrooloose/nerdtree)
2. Set up Vundle:

   `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
3. Copy .vimrc and .jshintrc files to ~/

4. Copy /colors dir to ~/.vim
5. Install jshint for syntastic to work on .js files

   `sudo npm install -g jshint`
6. Install Plugins:

   Launch vim and run `:PluginInstall`

   To install from command line: `vim +PluginInstall +qall`
7. Enable YouCompleteMe tab completion

   `cd ~/.vim/bundel/YouCompleteMe && ./install.sh`

   You may need to install cmake `brew install cmake`

## Vim Plugins
* [gmarik/Vundle.vim](http://github.com/gmarik/Vundle.vim)
* [tpope/vim-surround](http://github.com/tpope/vim-surround)
* [tpope/vim-repeat](http://github.com/tpope/vim-repeat)
* [tpope/vim-fugitive](http://github.com/tpope/vim-fugitive)
* [tpope/vim-unimpaired](http://github.com/tpope/vim-unimpaired)
* [mileszs/ack.vim](https://github.com/mileszs/ack.vim)
* [wincent/command-t](http://github.com/wincent/command-t)
* [tomtom/tcomment_vim](http://github.com/tomtom/tcomment_vim)
* [vim-scripts/mru.vim](http://github.com/vim-scripts/mru.vim)
* [bling/vim-airline](http://github.com/bling/vim-airline)
* [xolox/vim-misc](http://github.com/xolox/vim-misc)
* [xolox/vim-session](http://github.com/xolox/vim-session)
* [terryma/vim-multiple-cursors](http://github.com/terryma/vim-multiple-cursors)
* [scrooloose/syntastic](http://github.com/scrooloose/syntastic)
* [Valloric/YouCompleteMe](http://github.com/Valloric/YouCompleteMe)
* [junegunn/vim-easy-align](http://github.com/junegunn/vim-easy-align)
* [SirVer/ultisnips](http://github.com/SirVer/ultisnips)
* [honza/vim-snippets](http://github.com/honza/vim-snippets)

## Fugitive Screencasts
* [A complement to command line git](http://vimcasts.org/e/31)
* [Working with the git index](http://vimcasts.org/e/32)
* [Resolving merge conflicts with vimdiff](http://vimcasts.org/e/33)
* [Browsing the git object database](http://vimcasts.org/e/34)
* [Exploring the history of a git repository](http://vimcasts.org/e/35)
