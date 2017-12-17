source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"******************************************************************************
"" "                          << vundle >>
"******************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rakr/vim-one'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/lua.vim'
Plugin 'xolox/vim-misc'
Plugin 'flazz/vim-colorschemes'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"******************************************************************************
"" "                              << view >>
"******************************************************************************
set nocompatible "close vi
set number "line number
set ruler "status bar ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nobackup
set smartindent "new line auto tab
set backspace=indent,eol,start
colorscheme molokai
set hlsearch
syntax on
set ic
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif
au GUIEnter * simalt ~x 
if has("gui_running")
	set guioptions-=m 
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
	set guifont=Ubuntu_Mono_derivative_Powerlin:h12
	"set guioptions-=b
	"set showtabline=0
endif

set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

"******************************************************************************
"" "                              << ycm >>
"******************************************************************************
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let mapleader = ","

" Ctrl+O Ctrl+I
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoTOdefinitionElseDeclaration<CR>
"nmap <F4> :YcmDiags<CR>

" let g:ycm_collect_indentifiers_from_tags_files = 1
" let g:ycm_seed_indentifiers_with_syntax = 1
" let g:ycm_confirm_extra_conf = 0

"*******************************************************************************
"" "                              << vim-go >>
"*******************************************************************************
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

let g:go_bin_path = expand("~/.gotools")
"let g:go_bin_path = "/home/vimcoders/.mypath"
let g:go_get_update = 0
let g:go_term_mode = "split"
let g:go_term_enabled = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']}
let g:go_list_type = "quickfix"

"*******************************************************************************
"" "                              << ctrl-p >>
"********************************************************************l***********
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

"******************************************************************************
"" "                              << vim-airline >>
"******************************************************************************
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

"******************************************************************************
"" "                              << ag >>
"******************************************************************************
let g:ackprg = 'ag --nogroup --nocolor --column'

"******************************************************************************
"" "                              << gundo >>
"******************************************************************************
nnoremap <leader>h :GundoToggle<CR>

"******************************************************************************
"" "                          << lua >>
"******************************************************************************
" This sets the default value for all buffers.
let g:lua_compiler_name = '/usr/local/bin/luac'

" This is how you change the value for one buffer.
let b:lua_compiler_name = '/usr/local/bin/lualint'"
let g:lua_check_globals = 0
let g:lua_complete_omni = 1
" Here's the black list:
let g:lua_omni_blacklist = ['pl\.strict', 'lgi\..']
let g:lua_safe_omni_modules = 1
let g:lua_define_completefunc = 0
let g:lua_define_omnifunc = 0

"******************************************************************************
"" "                              << Title >>
"******************************************************************************
autocmd BufNewFile *.cpp,*.[ch],*.sh call SetTitle()
autocmd BufNewFile *.go call SetTitle()
autocmd BufNewFile *.lua call SetTitle()
autocmd BufNewFile * normal G

function! s:template_autocreate()
  " create new template from scratch
  if get(g:, "go_template_autocreate", 1)
    call go#template#create()
  endif
endfunction

func SetTitle()
	echo expand("%:t")
	if (expand("%:e") == 'cpp' || expand("%:e") == 'c' || expand("%:e") == 'h')
		call setline(1, "/* ")
		call append(line("."), " * File Name: ".expand("%:t"))
		call append(line(".")+1, " * Descript: ")
		call append(line(".")+2, " * ")
		call append(line(".")+3, " * Version: 1.0 ")
		call append(line(".")+4, " * Created Time: ".strftime("%D %T"))
		call append(line(".")+5, " * Compiler: ")
		call append(line(".")+6, " * Editor: vim ")
		call append(line(".")+7, " * Author: Jimbo ")
		call append(line(".")+8, " * Mail: jimboo.lu@gmail.com ")
		call append(line(".")+9, " *")
		call append(line(".")+10, " * Company: ")
		call append(line(".")+11, " */")
		call append(line(".")+12, " ")
	endif
	if (expand("%:e") == 'go')
		call s:template_autocreate()
		normal ggO
		call setline(1, "/* ")
		call append(line("."), " * File Name: ".expand("%:t"))
		call append(line(".")+1, " * Descript: ")
		call append(line(".")+2, " * ")
		call append(line(".")+3, " * Version: 1.0 ")
		call append(line(".")+4, " * Create Time: ".strftime("%D %T"))
		call append(line(".")+5, " * Compiler: ")
		call append(line(".")+6, " * Editor: vim ")
		call append(line(".")+7, " * Author: Jimbo")
		call append(line(".")+8, " * Mail: jimboo.lu@gmail.com")
		call append(line(".")+9, " * ")
		call append(line(".")+10, " * Company: ")
		call append(line(".")+11, " */ ")
		call append(line(".")+12, " ")
	endif
	if (expand("%:e") == 'lua')
		call setline(1, "--")
		call append(line("."), "-- File Name: ".expand("%:t"))
		call append(line(".")+1, "-- Descript: ")
		call append(line(".")+2, "-- ")
		call append(line(".")+3, "-- Version: 1.0 ")
		call append(line(".")+4, "-- Create Time: ".strftime("%D %T"))
		call append(line(".")+5, "-- Compiler: ")
		call append(line(".")+6, "-- Editor: vim ")
		call append(line(".")+7, "-- Author: Jimbo")
		call append(line(".")+8, "-- Mail: jimboo.lu@gmail.com")
		call append(line(".")+9, "-- ")
		call append(line(".")+10, "-- Company: ")
		call append(line(".")+11, "-- ")
	endif
	if (expand("%:e") == 'sh')
		call setline(1, "#!/bin/bash")
		call append(line("."), "# ")
		call append(line(".")+1, "# File Name: ".expand("%"))
		call append(line(".")+2, "# Descript: ")
		call append(line(".")+3, "# ")
		call append(line(".")+4, "# Version: 1.0 ")
		call append(line(".")+5, "# Create Time: ".strftime("%D %T"))
		call append(line(".")+6, "# Compiler: ")
		call append(line(".")+7, "# Editor: vim ")
		call append(line(".")+8, "# Author: Jimbo")
		call append(line(".")+9, "# Mail: jimboo.lu@gmail.com")
		call append(line(".")+10, "# ")
		call append(line(".")+11, "# Company: ")
		call append(line(".")+12, "# ")
	endif
endfunc

"******************************************************************************
""                                << write >>
"******************************************************************************
"inoremap( ()<ESC>i
"inoremap[ []<ESC>i
"inoremap{ {<ENTER>}<ESC>ko
"set autoread
"nmap cS :%s/\s+$//g<cr>:noh<cr>
"nmap cM :%s/\r$//g<cr>:noh<cr>
imap <c-K> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
"autocmd Vimleave * nested if (!isdirectory($HOME. "/.vim")) |
"	\ call mkdir($HOME . "/.vim") |
"	\ endif |
"	\ execute "mksession!" . $HOME . "/.vim/Session.vim"
"
"autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"\ execute "source " . $HOME . "/.vim/Session.vim"

set nobackup
