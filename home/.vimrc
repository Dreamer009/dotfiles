set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'Ack.vim'
Plugin 'wincent/command-t'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set expandtab
set shiftwidth=2
set autoindent
set noruler
set smartindent
set smarttab
set softtabstop=2
set splitright
set tabstop=2
set nowrap
set spr
set number
set autoread
set incsearch
set list
set listchars=
set spell
set wildmode=longest,list,full
set wildmenu
set directory=~/.vim/swap,.
set nobackup       #no backup files
set nowritebackup  #only in case you don't want a backup file while editing
set noswapfile     #no swap files

"colorscheme torte
colorscheme monokai

"allows <C-Q> to reach vim
silent !stty -ixon > /dev/null 2>/dev/null

"add back visual block mapping
:map <C-Q> <C-v>

" strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" search for something
nmap <Leader>a :Ack ""<Left>

" search for the word under the cursor
nmap <Leader>A :Ack <C-r><C-w><CR>

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nnoremap <C-R> :%s///g<Left><LEFT><Left>

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set laststatus=2

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UtilSnips", "vim-snippets/UltiSnips"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim-multiple-cursors settings
let g:multi_cursor_exit_from_visual_mode = 0

" tcomment_vim settings
nmap <C-c> ::TComment<CR>
vmap <C-c> ::TComment<CR>

" vim-easy-align settings
nmap <C-a> :EasyAlign
vmap <C-a> :EasyAlign

" open window after fugitive Ggrep
nmap <Leader>c :Git checkout %<CR>
nmap <d-F> :Ggrep ""<Left>
autocmd QuickFixCmdPost *grep* tabnew %
autocmd QuickFixCmdPost *grep* cwindow

" set auto syntax highlighting
au BufNewFile,BufRead *.erb set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html

" save file to clipboard
nmap <Leader>f :let @* = expand("%")<CR>

" close tab
nmap <Leader>w :tabclose<CR>
nmap <d-w> :tabclose<CR>
nmap <Leader>p :tabnew<CR>:MRU<CR>

" xolox/vim-session settings
let g:session_lock_enabled      = 0 " Disable all session locking - I know what I'm doing :-).
let g:session_default_to_last   = 1 " set the default to the last used
let g:session_autosave_periodic = 1 " save every minute
