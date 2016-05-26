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

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/home/vimcoders/.vim/bundle/Vundle.vim
call vundle#begin('/usr/share/vim/vimfiles/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"******************************************************************************
""                           < >
"******************************************************************************

set nocompatible 
set mouse=v
syntax on 
colorscheme molokai 
set number 
set cursorline 
set ruler 
set shiftwidth=4 
set softtabstop=4 
set tabstop=4 
set nobackup 
set autochdir 
filetype plugin indent on 
set backupcopy=yes 
set ignorecase smartcase 
set nowrapscan 
set incsearch 
set hlsearch 
set noerrorbells 
set novisualbell 
set t_vb= 
" set showmatch 
" set matchtime=2 
set magic 
set hidden 
set guioptions-=T 
set guioptions-=m 
set smartindent 
set backspace=indent,eol,start
set cmdheight=1 
set laststatus=2 
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\  

set foldenable 
set foldmethod=syntax 
set foldcolumn=0 
setlocal foldlevel=1 
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk 
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<ENTER>}<ESC>ko

"******************************************************************************
"" "                          << >>
"******************************************************************************
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

func SetTitle()
  if &filetype == 'cpp'
    call setline(1,"/*******************************************************************************")
    call append(line("."), " File Name: ".expand("%"))
    call append(line(".")+1, " Descript:")
    call append(line(".")+2, " ")
    call append(line(".")+3, " Version: 1.0")
    call append(line(".")+4, " Created Time: ".strftime("%D %T"))
    call append(line(".")+5, " Compiler: ")
    call append(line(".")+6, " Editor: vim")
    call append(line(".")+7, " Author: Jimbo")
    call append(line(".")+8, " mail: jimboo.lu@gmail.com")
    call append(line(".")+9, " ")
    call append(line(".")+10, " Company: ")
    call append(line(".")+11, "*******************************************************************************/")
    call append(line(".")+12, "")
    call append(line(".")+13, "#ifndef ".expand("%")) 
    call append(line(".")+14, "#define ".expand("%"))
    call append(line(".")+15, "#include <".expand("%").">")
    call append(line(".")+16, "#endif")
  endif
  if &filetype == 'h'
    call setline(1,"/*******************************************************************************")
    call append(line("."), " File Name: ".expand("%"))
    call append(line(".")+1, " Descript:")
    call append(line(".")+2, " ")
    call append(line(".")+3, " Version: 1.0")
    call append(line(".")+4, " Created Time: ".strftime("%D %T"))
    call append(line(".")+5, " Compiler: ")
    call append(line(".")+6, " Editor: vim")
    call append(line(".")+7, " Author: Jimbo")
    call append(line(".")+8, " mail: jimboo.lu@gmail.com")
    call append(line(".")+9, " ")
    call append(line(".")+10, " Company: ")
    call append(line(".")+11, "*******************************************************************************/")
    call append(line(".")+12, "")
    call append(line(".")+13, "#ifndef ".expand("%"))
    call append(line(".")+14, "#define ".expand("%"))
    call append(line(".")+15, "#include <".expand("%").">")
    call append(line(".")+16, "#endif")
  else
    call setline(1,"/*******************************************************************************")
    call append(line("."), " File Name: ".expand("%"))
    call append(line(".")+1, " Descript: ")
    call append(line(".")+2, " ")
    call append(line(".")+3, "Version: 1.0")
    call append(line(".")+4, "Created Time: ".strftime("%D %T"))
    call append(line(".")+5, "Compiler: ")
    call append(line(".")+6, "Editor: vim")
    call append(line(".")+7, "Author: Jimbo")
    call append(line(".")+8, "Mail: jimboo.lu@gmail.com")
    call append(line(".")+9, "Company: ")
    call append(line(".")+10, "*******************************************************************************/") 
  endif
    autocmd BufNewFile * normal G 
endfunc

func SetBlockNote() 
    call setline(1,"/*******************************************************************************") 
    call append(line("."), "/// <summary>") 
    call append(line(".")+1, "/// Add Description") 
    call append(line(".")+2, "/// </summary>")
    autocmd BufNewFile * normal G
endfunc

func SetLine()
    call append(line("."),"/********************************************************************************")
    call append(line(".")+1," ")
    call append(line(".")+2,"*******************************************************************************/")
    autocmd BufNewFile * normal G
endfunc


"*****************************************************************************
""                          <<  >>
"*****************************************************************************

set autoread

nmap cS :%s/\s\+$//g<cr>:noh<cr>

nmap cM :%s/\r$//g<cr>:noh<cr>

imap <c-k> <Up>

imap <c-j> <Down>

imap <c-h> <Left>

imap <c-l> <Right>

au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

"*****************************************************************************
"    
"*****************************************************************************
set encoding=utf-8                                    
set fileencoding=utf-8                                
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     

set fileformat=unix                                   
set fileformats=unix,dos,mac

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

language messages zh_CN.utf-8
