"    __  __                           _
"   / / / /___  _____________  _   __(_)___ ___
"  / /_/ / __ \/ ___/ ___/ _ \| | / / / __ `__ \
" / __  / /_/ / /  (__  )  __/| |/ / / / / / / /
"/_/ /_/\____/_/  /____/\___(_)___/_/_/ /_/ /_/
"
"

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
call plug#end()

set autoindent

" Automatically refresh files
set autoread

" 4 space indents
set shiftwidth=4

" Tabs are spaces
set expandtab

" Indentation every 4 columns
set tabstop=4

" Let backspace delete indent
set softtabstop=4

" Override indents for other file types
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" New vertial splits go on the right of the current window
set splitright

" New horizontal splits go below the current window
set splitbelow

" Remove trailing whitespaces and ^M chars
autocmd FileType * autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Allow backspace in insert mode
set backspace=indent,eol,start

" Highlight the current line
set cursorline

" No extra spaces between rows
set linespace=0

" Show absolute line # of cursor line
set relativenumber

" Turn on line #s
set number

" Show matchings brackets
set showmatch

" Incremental searching
set incsearch

" Highlight search terms
set hlsearch

" Windows can be 0 lines high
set winminheight=0

" Case insensitive search
set ignorecase

" Case sensitive search for upper case
set smartcase

" Show list for line-completion
set wildmenu

" Command <Tab> completion, list matches, then longest common part, then all
set wildmode=list:longest,full

" Backspaces and cursor keys also wrap
set whichwrap=b,s,h,l,<,>,[,]

" Jump 5 lines when cursor leaves the screen
set scrolljump=5

" Minimum 3 line padding for the cursor
set scrolloff=3

" Fast terminal connection
set ttyfast

" Enable folding
set foldenable

" Show tab depth and highlight other whitespace
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Status line
set laststatus=2
let g:airline_theme='powerlineish'

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Yank from the cursor to the end of the line
nnoremap Y y$

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Easier horizontal scrolling
map zl zL
map zh zH

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Default Color Scheme
syntax enable
set background=dark
set t_Co=256

colorscheme monokai
autocmd VimEnter,Colorscheme * :hi MatchParen ctermbg=blue guibg=lightblue

" Trigger fzf with ctrl-p
nnoremap <silent> <C-p> :FZF<CR>

" ALE
" Ctrl-j and Ctrl-k navigate through errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
  \ 'go': ['gopls'],
  \}

" NERDTree
let g:NERDShutUp=1
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.DS_Store', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Strip trailing whitespace
function! StripTrailingWhitespace()
  " To disable the stripping of whitespace, add the following to your
  " .vimrc.local file:
  "   let g:spf13_keep_trailing_whitespace = 1
  if !exists('g:spf13_keep_trailing_whitespace')
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endif
endfunction
