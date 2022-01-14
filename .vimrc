"2018-03-03 00:27:33
"" "	vundle                           
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'Raimondi/delimitMate'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
Plugin 'fatih/vim-go'
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
Plugin 'buoto/gotests-vim'
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
syntax on

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

autocmd BufWritePre *.go :GoImports
autocmd BufWritePre *.go :GoFmt
autocmd BufWritePre *.c :ClangFormat
autocmd BufWritePre *.cpp :ClangFormat
autocmd BufWritePre *.cc :ClangFormat
autocmd BufWritePre *.vue :Prettier
autocmd BufWritePre *.js :Prettier

"" "	ycm                                
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0                  "关闭语法提示
let g:ycm_complete_in_comments=1                   " 补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0                     " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 标签补全引擎
let g:ycm_min_num_of_chars_for_completion=1        " 从第一个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                         " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1           " 语法关键字补全
let g:ycm_goto_buffer_command = 'horizontal-split' " 跳转打开上下分屏
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let mapleader = ","

"" "	vim-go
nmap gr :GoReferrers<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
let g:go_play_open_browser = 0

let g:go_bin_path = expand("~/go/bin")
let g:go_get_update = 0
let g:go_term_mode = "split"
let g:go_term_enabled = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']}
let g:go_list_type = "quickfix"
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"au filetype go inoremap <buffer> . .<C-x><C-o>

"" "	ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.prignor']
let g:ctrlp_switch_buffer = 'et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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
