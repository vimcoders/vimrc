" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org

" Source a global configuration file if available
if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif

"******************************************************************************
"" "                          << vundle >>
"******************************************************************************

" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"******************************************************************************
"" "                              << ycm >>
"******************************************************************************
let g:ycm_global_ycm_extra_config = '~/.ycm_extra_config.py'
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
"" "                              << nerdtree>>
"******************************************************************************
"*******************************************************************************
"" "                             << ctrlp-funky >>
"*******************************************************************************
"nnoremap fu :CtrlPFunky
"nnoremap fu :execute 'CtrlpFunky ' . expand('')
"let g:ctrlp_funky_syntax_hightlight = 1
"let g:ctrlp_extensions = ['funky']
"******************************************************************************
"" "                              << vim-airline >>
"******************************************************************************
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

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
set encoding=utf-8
set termencoding=utf-8
set fencs=utf-8,gbk
colorscheme molokai
set hlsearch
syntax on
set ic
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

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
	if (expand("%:e") == 'cpp' || expand("%:e") == 'c' || expand("%e") == 'h')
		call setline(1, "/* ")
		call append(line("."), " * File Name: ".expand("%"))
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
		call append(line("."), " * File Name: ".expand("%"))
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
		call append(line("."), "-- File Name: ".expand("%"))
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
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
autocmd Vimleave * nested if (!isdirectory($HOME. "/.vim")) |
	\ call mkdir($HOME . "/.vim") |
	\ endif |
	\ execute "mksession!" . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
	\ execute "source " . $HOME . "/.vim/Session.vim"
