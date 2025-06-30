set number

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4

"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
set guicursor=
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>

"See invisible characters
set list listchars=tab:>\ ,trail:+,eol:$

"wrap to next line when end of line is reached
set whichwrap+=<,>,[,]
" New config
set wildmode=longest,list
syntax on
set clipboard=unnamedplus
filetype plugin on
"set cursorline
set ttyfast
set ignorecase
set showmatch

"Plugins
call plug#begin('~/.vim/plugged')
  Plug 'dracula/vim'
"  Plug 'ryanoasis/vim-devicons'
"  Plug 'SirVer/ultisnips'
"  Plug 'honza/vim-snippets'
"  Plug 'scrooloose/nerdtree'
"  Plug 'preservim/nerdcommenter'
"  Plug 'mhinz/vim-startify'
"  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
