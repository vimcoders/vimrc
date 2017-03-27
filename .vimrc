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
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'fatih/vim-go'

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
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoTOdefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

" let g:ycm_collect_indentifiers_from_tags_files = 1
" let g:ycm_seed_indentifiers_with_syntax = 1
" let g:ycm_confirm_extra_conf = 0

"*******************************************************************************
"" "                              << vim-go >>
"*******************************************************************************
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-splith)
au FileType go nmap <leader>rv <Plug>(go-run-vertical)

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
"let g:ctrlp_map = 'p'
"let g:ctrlp_cmd = 'CtrlP'
"map f :CtrlPMRU
"let g:ctrlp_custom_ignore = {
"    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
"    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"    \}
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_match_window_bottom=1
"let g:ctrlp_max_height=15
"let g:ctrlp_match_window_reversed=0
"let g:ctrlp_mruf_max=500
"let g_ctrlp_follow_symlinks=1
"*******************************************************************************
"" "                             << ctrlp-funky >>
"*******************************************************************************
"nnoremap fu :CtrlPFunky
"nnoremap fu :execute 'CtrlpFunky ' . expand('')
"let g:ctrlp_funky_syntax_hightlight = 1
"let g:ctrlp_extensions = ['funky']
"******************************************************************************
"" "                              << view >>
"******************************************************************************
set nocompatible "close vi
set number "line number
set ruler "status bar ruler
set shiftwidth=4
set softtabstop=4
set nobackup
set smartindent "new line auto tab
set backspace=indent,eol,start
set encoding=utf-8
set termencoding=utf-8
set fencs=utf-8,gbk
colorscheme molokai
syntax on

"******************************************************************************
"" "                              << Title >>
"******************************************************************************
autocmd BufNewFile *.cpp,*.[ch],*.sh, exec ":call SetTitle()"
autocmd BufNewFile *.go exec ":call SetTitle()"

func SetTitle()
    if (expand("%:e") == 'cpp')
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
    if (expand("%:e") == 'h')
	call setline(1, "/*")
	call append(line("."), " * File Name: ".expand("%"))
	call append(line(".")+1, " * Descript: ")
	call append(line(".")+2, " * ")
	call append(line(".")+3, " * Version: 1.0 ")
	call append(line(".")+4, " * Created Time: ".strftime("%D %T"))
	call append(line(".")+5, " * Compiler: ")
	call append(line(".")+6, " * Editor: vim ")
	call append(line(".")+7, " * Author: Jimbo ")
	call append(line(".")+8, " * Mail: jimboo.lu@gmail.com ")
	call append(line(".")+9, " * ")
	call append(line(".")+10, " * Company: ")
	call append(line(".")+11, " */ ")
	call append(line(".")+12, " ")
    endif
    if (expand("%:e") == 'go')
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
	call append(line(".")+13, "package ".expand("%:r"))
	call append(line(".")+14, "")
	if (expand("%:r") == 'main')
	    call append(line(".")+15, 'import "fmt"')
	    call append(line(".")+16, "")
	    call append(line(".")+17, "func main() {")
	    call append(line(".")+18, '    fmt.Print("hello world")')
	    call append(line(".")+19, "}")
	    call append(line(".")+20, "")
	endif
    endif
"	autocmd BufNewFile * normal G
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
