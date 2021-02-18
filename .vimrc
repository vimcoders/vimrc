"2018-03-03 00:27:33
"" "	vundle                           
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'Raimondi/delimitMate'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'rakr/vim-one'
"Plugin 'mileszs/ack.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'vim-scripts/grep.vim'
"Plugin 'vim-scripts/lua.vim'
"Plugin 'xolox/vim-misc'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
"Plugin 'othree/html5.vim'
"Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
"Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
"Plugin 'buoto/gotests-vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'prettier/vim-prettier'
Plugin 'vim-erlang/vim-erlang-omnicomplete'

call vundle#end()

"" "	view                              
set cursorline
set smarttab
set showcmd 
set history=400
set mouse=a
set nocompatible
set number
set ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set backspace=indent,eol,start
set hlsearch

" 控制台响铃
set noerrorbells
set novisualbell
set t_vb= 

" 状态栏显示目前所执行的指令
set showcmd 

if &term=="xterm"
	set t_Co=8
	set t_Sb=^[[4%dm
	set t_Sf=^[[3%dm
endif
" au GUIEnter * simalt ~x 
if has("gui_running")
	set guioptions-=m 
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
	set guifont=Powerline_Consolas:h13
endif

set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"language messages zh_CN.utf-8
colorscheme molokai

"" "write                                  
let g:AutoPairsMapCh = 0
imap <c-K> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

set backup
set swapfile
set undofile
set autoread
set dir=~/.vim/.tmp
set udir=~/.vim/.undo
set bdir=~/.vim/.backup
set noic
filetype off
filetype plugin indent on

" 返回当前时间
func! GetTimeInfo()
	return strftime('%Y-%m-%d %H:%M:%S')
endfunction

" 插入模式按 Ctrl + D(ate) 插入当前时间
imap <C-d> <C-r>=GetTimeInfo()<cr>

inoremap <buffer> : :<C-x><C-o>

"" "	vim-airline 
set t_Co=256
set laststatus=2 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
if !exists('g:airline_symbols') 
	let g:airline_symbols={} 
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#tabline#fnamemod = ':t:.'

"" "	easy-align 
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EashAlign)
