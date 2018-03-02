"2018-03-03 00:27:33
"******************************************************************************
"" "                          << vundle >>
"******************************************************************************
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin()

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
Plugin 'tpope/vim-fugitive'
Plugin 'othree/html5.vim'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

"******************************************************************************
"" "                              << view >>
"******************************************************************************
syntax enable
syntax on
set autoread
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
set nobackup
set smartindent
set backspace=indent,eol,start
set hlsearch
syntax on
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
language messages zh_CN.utf-8
colorscheme molokai

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

let g:go_bin_path = expand("~/go/bin")
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
"" "                          << easy-align >>
"******************************************************************************
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EashAlign)
"******************************************************************************
"" "                          << lua >>
"******************************************************************************
let g:lua_compiler_name = '/usr/local/bin/luac'

let b:lua_compiler_name = '/usr/local/bin/lualint'"
let g:lua_check_globals = 0
let g:lua_complete_omni = 1
let g:lua_omni_blacklist = ['pl\.strict', 'lgi\..']
let g:lua_safe_omni_modules = 1
let g:lua_define_completefunc = 0
let g:lua_define_omnifunc = 0

"******************************************************************************
"" "                              << Title >>
"******************************************************************************
autocmd BufNewFile *.cpp call SetTitle()
autocmd BufNewFile *.h call SetTitle()
autocmd BufNewFile *.sh call SetTitle()
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
	"if (expand("%:e") == 'go')
	"	call s:template_autocreate()
	"	normal ggO
	"	call setline(1, "/* ")
	"	call append(line("."), " * File Name: ".expand("%:t"))
	"	call append(line(".")+1, " * Descript: ")
	"	call append(line(".")+2, " * ")
	"	call append(line(".")+3, " * Version: 1.0 ")
	"	call append(line(".")+4, " * Create Time: ".strftime("%D %T"))
	"	call append(line(".")+5, " * Compiler: ")
	"	call append(line(".")+6, " * Editor: vim ")
	"	call append(line(".")+7, " * Author: Jimbo")
	"	call append(line(".")+8, " * Mail: jimboo.lu@gmail.com")
	"	call append(line(".")+9, " * ")
	"	call append(line(".")+10, " * Company: ")
	"	call append(line(".")+11, " */ ")
	"	call append(line(".")+12, " ")
	"endif
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
imap <c-K> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
autocmd Vimleave * nested if (!isdirectory($HOME. "/.vim")) |
	\ call mkdir($HOME . "/.vim") |
	\ endif |
	\ execute "mksession!" . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
\ execute "source " . $HOME . "/.vim/Session.vim"

set nobackup
set noswapfile
set noundofile
set noic
" 返回当前时间
func! GetTimeInfo()
    "return strftime('%Y-%m-%d %A %H:%M:%S')
    return strftime('%Y-%m-%d %H:%M:%S')
endfunction

" 插入模式按 Ctrl + D(ate) 插入当前时间
imap <C-d> <C-r>=GetTimeInfo()<cr>

autocmd BufWrite *.go :GoFmt
autocmd BufWrite *.go :GoImports

"******************************************************************************
"               基础命令
"******************************************************************************
"   ctrl+q              可以联合复制，粘贴，替换用 行操作
"   ctrl+w+j ctrl+w+k (:bn :bp :bd)

"   '.                  它移动光标到上一次的修改行
"   `.                  它移动光标到上一次的修改点
"   .                   重复上次命令
"   <C-O> :             依次沿着你的跳转记录向回跳 (从最近的一次开始)
"   <C-I> :             依次沿着你的跳转记录向前跳
"   ju(mps) :           列出你跳转的足迹
"   :history :          列出历史命令记录
"   :his c :            命令行命令历史
"   :his s :            搜索命令历史
"   q/ :                搜索命令历史的窗口
"   q: :                命令行命令历史的窗口
"   g ctrl+g            计算文件字符
"   {,}                 前进至上一段落前进至后一段落
"   gg,G(2G)            文件首
"   gd dw gf ga(进制转化)
"   gg=G 全篇自动缩进 , =G 单行缩进

"* ci[ 删除一对 [] 中的所有字符并进入插入模式
"* ci( 删除一对 () 中的所有字符并进入插入模式
"* ci< 删除一对 <> 中的所有字符并进入插入模式
"* ci{ 删除一对 {} 中的所有字符并进入插入模式
"* cit 删除一对 HTML/XML 的标签内部的所有字符并进入插入模式
"* ci” ci’ ci` 删除一对引号字符 (” 或 ‘ 或 `) 中所有字符并进入插入模式
"
"* vi[ 选择一对 [] 中的所有字符
"* vi( 选择一对 () 中的所有字符
"* vi< 选择一对 <> 中的所有字符
"* vi{ 选择一对 {} 中的所有字符
"* vit 选择一对 HTML/XML 的标签内部的所有字符
"* vi” vi’ vi` 选择一对引号字符 (” 或 ‘ 或 `) 中所有字符

"   crl+] 函数原型处 crl+t 回 ( ctags )
"   ctl+p 自动补全( 编辑状态 )
"   :X 加密保存( 要输入密码 )
"   ? /         (N n)
"   f(F,t) 查找字符
"   w(e) 移动光标到下一个单词.
"   5fx 表示查找光标后第 5 个 x 字符.
"   5w(e) 移动光标到下五个单词.

"   b 移动光标到上一个单词.
"   0 移动光标到本行最开头.
"   ^ 移动光标到本行最开头的字符处.
"   $ 移动光标到本行结尾处.
"   H 移动光标到屏幕的首行.
"   M 移动光标到屏幕的中间一行.
"   L 移动光标到屏幕的尾行.

"   c-f (即 ctrl 键与 f 键一同按下)
"   c-b (即 ctrl 键与 b 键一同按下) 翻页
"   c-d (下半页) c-u(上半页) c-e (一行滚动)
"   zz 让光标所在的行居屏幕中央
"   zt 让光标所在的行居屏幕最上一行
"   zb 让光标所在的行居屏幕最下一行

"   在 vi 中 y 表示拷贝, d 表示删除, p 表示粘贴. 其中拷贝与删除是与光标移动命令
"   yw 表示拷贝从当前光标到光标所在单词结尾的内容.
"   dw 表示删除从当前光标到光标所在单词结尾的内容.
"   y0 表示拷贝从当前光标到光标所在行首的内容.
"   d0 表示删除从当前光标到光标所在行首的内容.
"   y$(Y) 表示拷贝从当前光标到光标所在行尾的内容.
"   d$(D) 表示删除从当前光标到光标所在行尾的内容.
"   yfa 表示拷贝从当前光标到光标后面的第一个a字符之间的内容.
"   dfa 表示删除从当前光标到光标后面的第一个a字符之间的内容.
"   s(S),a(A),x(X),D
"   yy 表示拷贝光标所在行.
"   dd 表示删除光标所在行.

"   5yy 表示拷贝光标以下 5 行.
"   5dd 表示删除光标以下 5 行.
"   y2fa 表示拷贝从当前光标到光标后面的第二个a字符之间的内容.
"   :12,24y 表示拷贝第12行到第24行之间的内容.
"   :12,y 表示拷贝第12行到光标所在行之间的内容.
"   :,24y 表示拷贝光标所在行到第24行之间的内容. 删除类似.
"   TAB 就是制表符, 单独拿出来做一节是因为这个东西确实很有用.
"   << 输入此命令则光标所在行向左移动一个 tab.
"   >> 输入此命令则光标所在行向右移动一个 tab.
"   5>> 输入此命令则光标后 5 行向右移动一个 tab.
"   :5>>(>>>) :>>(>>>)5
"   :12,24> 此命令将12行到14行的数据都向右移动一个 tab.

"   :12,24>> 此命令将12行到14行的数据都向右移动两个 tab.
"   :set shiftwidth=4 设置自动缩进 4 个空格, 当然要设自动缩进先.
"   :set sts=4 即设置 softtabstop 为 4. 输入 tab 后就跳了 4 格.
"   :set tabstop=4 实际的 tab 即为 4 个空格, 而不是缺省的 8 个.
"   :set expandtab 在输入 tab 后, vim 用恰当的空格来填充这个 tab.
"   :g/^/exec 's/^/'.strpart(line('.').' ', 0, 4) 在行首插入行号
"   set ai 设置自动缩进
"   5ia<esc> 重复插入5个a字符

"******************************************************************************
"               替换命令
"******************************************************************************
"   替换文字 2009-02-34 ----> 2009-02-34 00:00:00
"   :%s/\(\d\{4\}-\d\{2\}-\d\{2\}\)/\1 00:00:00/g

"   :s/aa/bb/g              将光标所在行出现的所有包含 aa 的字符串中的 aa 替换为 bb
"   :s/\/bb/g               将光标所在行出现的所有 aa 替换为 bb, 仅替换 aa 这个单词
"   :%s/aa/bb/g             将文档中出现的所有包含 aa 的字符串中的 aa 替换为 bb
"   :12,23s/aa/bb/g         将从12行到23行中出现的所有包含 aa 的字符串中的 aa 替换为 bb
"   :12,23s/^/#/            将从12行到23行的行首加入 # 字符
"   :%s/fred/joe/igc            一个常见的替换命令，修饰符igc和perl中一样意思
"   s/dick/joe/igc则        对于这些满足条件的行进行替换

"   :g/^\s*$/d              空行(空格也不包含)删除.
"   :%s/\r//g               删除DOS方式的回车^M
"   :%s/ *$//               删除行尾空白(%s/\s*$//g)
"   :g!/^dd/d               删除不含字符串'dd'开头的行
"   :v/^dd/d                同上,译释：v == g!，就是不匹配！
"   :v/./.,/./-1join        压缩空行(多行空行合并为一行)
"   :g/^$/,/./-j            压缩空行(多行空行合并为一行)
"   :g/^/pu _               把文中空行扩增一倍 (pu = put),原来两行间有一个空行，现在变成2个
"   :g/^/m0                 按行翻转文章 (m = move)
"   :g/fred/,/joe/d         not line based (very powerfull)
"   :g/<input\|<form/p      或者 要用\|
"   :g/fred/t$              拷贝行，从fred到文件末尾(EOF)

"   :%norm jdd              隔行删除,译释：%指明是对所有行进行操作,norm指出后面是normal模式的指令,j是下移一行，dd是删除行

"   :'a,'bg/fred/s/dick/joe/igc   ('a,'b指定一个范围：mark a ~ mark b)
"   g//用一个正则表达式指出了进行操作的行必须可以被fred匹配,g//是一个全局显示命令

"   /joe/e                  光标停留在匹配单词最后一个字母处
"   /joe/e+1                光标停留在匹配单词最后一个字母的下一个字母处
"   /joe/s                  光标停留在匹配单词第一个字母处
"   /^joe.*fred.*bill/      标准正则表达式
"   /^[A-J]\+/              找一个以A~J中一个字母重复两次或以上开头的行
"   /forum\(\_.\)*pent      多行匹配
"   /fred\_s*joe/i          中间可以有任何空白，包括换行符\n
"   /fred\|joe              匹配FRED或JOE
"   /\<fred\>/i             匹配fred,fred必须是一个独立的单词，而不是子串
"   /\<\d\d\d\d\>           匹配4个数字 \<\d\{4}\>

"   列，替换所有在第三列中的str1
"   :%s:\(\(\w\+\s\+\)\{2}\)str1:\1str2:
"   交换第一列和最后一列 (共4列)
"   :%s:\(\w\+\)\(.*\s\+\)\(\w\+\)$:\3\2\1:

"   全局(global)显示命令，就是用 :g＋正则表达式
"   译释： :g/{pattern}/{cmd} 就是全局找到匹配的,然后对这些行执行命令{cmd}
"   :g/\<fred\>/                                显示所有能够为单词fred所匹配的行
"   :g/<pattern>/z#.5                           显示内容，还有行号
"   :g/<pattern>/z#.5|echo '=========='         漂亮的显示

"******************************************************************************
"           多文档操作 (基础)
"******************************************************************************
"    用 :ls! 可以显示出当前所有的buffer
"   :bn                 跳转到下一个buffer
"   :bp                 跳转到上一个buffer
"   :wn                 存盘当前文件并跳转到下一个
"   :wp                 存盘当前文件并跳转到上一个
"   :bd                 把这个文件从buffer列表中做掉
"   :b 3                跳到第3个buffer
"   :b main             跳到一个名字中包含main的buffer

"******************************************************************************
"           多文档操作 (基础)
"           列复制
"******************************************************************************
"           多文档操作 (基础)
"   译注：@#%&^#*^%#$!
"   :%s= [^ ]\+$=&&= : 复制最后一列
"   :%s= \f\+$=&&= : 一样的功能
"   :%s= \S\+$=&& : ft,还是一样
"   反向引用，或称记忆
"   :s/\(.*\):\(.*\)/\2 : \1/ : 颠倒用:分割的两个字段
"   :%s/^\(.*\)\n\1/\1$/ : 删除重复行
"   非贪婪匹配，\{-}
"   :%s/^.\{-}pdf/new.pdf/ : 只是删除第一个pdf
"   跨越可能的多行
"   :%s/<!--\_.\{-}-->// : 又是删除多行注释（咦？为什么要说「又」呢？）
"   :help /\{-} : 看看关于 非贪婪数量符 的帮助
"   :s/fred/<c-r>a/g : 替换fred成register a中的内容，呵呵
"   写在一行里的复杂命令
"   :%s/\f\+\.gif\>/\r&\r/g | v/\.gif$/d | %s/gif/jpg/
"   译注：就是用 | 管道啦

"******************************************************************************
"           多文档操作 (基础)
"           大小写转换
"******************************************************************************
"           多文档操作 (基础)
"   g~~ : 行翻转
"   vEU : 字大写(广义字)
"   vE~ : 字翻转(广义字)
"   ~   将光标下的字母改变大小写
"   3~  将下3个字母改变其大小写
"   g~w 字翻转
"   U   将可视模式下的字母全改成大写字母
"   gUU 将当前行的字母改成大写
"   u   将可视模式下的字母全改成小写
"   guu 将当前行的字母全改成小写
"   gUw 将光标下的单词改成大写。
"   guw 将光标下的单词改成小写。


"   文件浏览
"   :Ex : 开启目录浏览器，注意首字母E是大写的
"   :Sex : 在一个分割的窗口中开启目录浏览器
"   :ls : 显示当前buffer的情况
"   :cd .. : 进入父目录
"   :pwd
"   :args : 显示目前打开的文件
"   :lcd %:p:h : 更改到当前文件所在的目录
"    译释：lcd是紧紧改变当前窗口的工作路径，% 是代表当前文件的文件名,
"    加上 :p扩展成全名（就是带了路径），加上 :h析取出路径
