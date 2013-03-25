"/////////////////////////////////////////////////////////////////////////////////
"//         FILE:  .vimrc							                            //
"//  DESCRIPTION:  suggestion for a personal configuration file ~/.vimrc	    //
"//       AUTHOR:  zhoulh							                            //
"//      CREATED:  2012-10-01						                            //
"/////////////////////////////////////////////////////////////////////////////////

" sudo apt-get install build-essential python python-dev vim ctags vim-doc
" lrzsz
" sudo apt-get install vim-scripts pylint cscope splint git-core zip unzip
" libmysqlclient-dev
" wget https://github.com/cburroughs/pep8.pylint

"===================================================================================
" 基本配置
"===================================================================================
filetype plugin on				        " 自动检测文件类型并加载相应的设置
filetype indent on				        " 自动检测文件类型并加载相应的设置
set autoread                    		" 默认自动加载已经修改的文件
set autowrite                   		" vim使用tag进行切换时,修改的文件被自动保存
set wildignore=*.bak,*.o,*.e,*~ 		" 忽略这些文件扩展名
set browsedir=current           		" 改变浏览的启动目录
set autochdir					        " 自动切换当前目录为当前文件所在的目录
set cursorline					        " 设置光标行
set equalalways             			" 分割窗口时保持相等的宽/高
set nobackup					        " 不产生备份文件
set nocompatible				        " 去掉有关vi一致性模式，避免以前版本的一些bug和局限
set noswapfile              			" 编辑时不产生交换文件
set noexpandtab             			" 插入 tab 符号不以空格替换
set history=1000				        " 设置冒号命令和搜索命令的命令历史列表的长度
set autoindent					        " 设置自动缩进：即每行的缩进值与上一行相等，使用 noautoindent 取消设置
set smartindent					        " 依据上面的格式，智能的选择对齐方式，对于类似C语言编写很有用处
set smarttab                			" 开启新行时使用智能 tab 缩进
set nu						            " 自动开启行号
set expandtab					        " 语法高亮度显示
set encoding=utf-8				        " 设置编码自动识别, 中文引号显示
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,cp936,big5,euc-jp,euc-kr,latin1,ucs-bom,gbk
set ambiwidth=double
set showcmd					            " 输入的命令显示出来，看的清楚些。
set enc=utf-8
set ignorecase					        " 大小写无关匹配
set smartcase					        " 只能匹配，即小写全匹配，大小写混合则严格匹配
set langmenu=zh_CN.UTF-8			    " 语言设置
syntax enable					        " 语法高亮显示
syntax on
set filetype=c					        " 开启支持C语法文件
set tabstop=4					        " 不讨论制表符为8还是为4较好，这里设置（软）制表符宽度为4：
set softtabstop=4
set shiftwidth=4				        " 设置缩进的空格数为4
set cindent					            " 设置使用 C/C++ 语言的自动缩进方式：
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s " 设置C/C++语言的具体缩进方式
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif
set showmatch					        " 设置匹配模式，当属于一个左括号时会匹配相应的那个右括号
set vb t_vb=					        " 去掉错误警告时的提示音
set incsearch					        " 动态匹配查找的字符
set ruler					            " 在Vim窗口的右下角显示当前光标位置
set hlsearch					        " 高亮显示匹配的字符；临时关闭用:set nohlsearch
if exists("tags")				        " 启动vim时，如果存在tags则自动加载
set tags=./tags
endif
set backspace=2					        " insert模式下无法使用backspace
set guioptions=t            			" 隐藏菜单栏、工具栏、滚动条
set foldmethod=indent                   " 代码折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set wildmenu 					        " 自动补全命令时候使用菜单式匹配列表
set history=400					        " vim记住的历史操作的数量，默认的是20
" 括号自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf
set t_Co=256
"===================================================================================
" word_complete.vim : automatically offers word completion as you type 
"===================================================================================
":autocmd BufEnter * call DoWordComplete() 

"===================================================================================
"" Taglist & Ctags
"===================================================================================
"let Tlist_Auto_Open = 1                 "自动打开taglist窗口
let Tlist_Inc_Winwidth = 0
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File = 1             "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1           "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1          "在右侧窗口中显示taglist窗口 
"let Tlist_Use_Left_Window=1             "在右侧窗口中显示taglist窗口
map <F7> :TlistToggle<CR>
imap <F7> <ESC>:TlistToggle<CR>

"===================================================================================
" minibufexpl.vim : Elegant buffer explorer - takes very little screen space 
"===================================================================================
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 

"===================================================================================
" a.vim : Alternate Files quickly (.c --> .h etc) 
"===================================================================================
"用gvim打开源码文件后，按F12即可以在c/h文件中切换，也可以通过输入:A实现。
nnoremap <silent> <F12> :A<CR>
":A 在新Buffer中切换到c\h文件
":AS 横向分割窗口并打开c\h文件
":AV 纵向分割窗口并打开c\h文件
":AT 新建一个标签页并打开c\h文件

"===================================================================================
" grep.vim : Grep search tools integration with Vim 
"===================================================================================
"用gvim打开源码文件，并将光标定位到要查找的内容上，按下F3，确定要查找的内容
"和搜索范围，gvim会在弹出的QuickFix窗口中列出所有符合条件的搜索结果
nnoremap <silent> <F3> :Grep<CR>
"Grep在当前目录下面查找字符串
":Grep find_str *
"find_str是你需要查找的对象，*是当前目录下面所有的文件类型
"Grep查找当前目录和子目录中的字符串
":Grep -R find_str *
"跟上面的一样，不过多了一个-R参数，意为递规查询子目录。

"===================================================================================
" The NERD Commenter : A plugin that allows for easy commenting of code for
" many filetypes. 
"===================================================================================
"let mapleader=","
"ca，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
"cc，注释当前行
"c，切换注释/非注释状态
"cs，以”性感”的方式注释
"cA，在当前行尾添加注释符，并进入Insert模式
"cu，取消注释
"Normal模式下，几乎所有命令前面都可以指定行数
"Visual模式下执行命令，会对选中的特定区块进注释/反注释

"===================================================================================
" Pydiction : Tab-complete your Python code
"===================================================================================
"pydiction 1.2 python auto complete
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'

"===================================================================================
" molokai : A port of the monokai scheme for TextMate 
"===================================================================================
let g:molokai_original = 1
colorscheme molokai                     " 配色方案

"===================================================================================
" The NERD tree : A tree explorer plugin for navigating the filesystem 
"===================================================================================
map <F6> :NERDTreeToggle<CR>
imap <F6> <ESC>:NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree             "启动Vim时自动打开nerdtree
let NERDTreeIgnore=['^cscope', '^tags$']

"===================================================================================
" SuperTab : Do all your insert-mode completion with Tab. 
"===================================================================================
"1. Download supertab.vmb to any directory. 
"2. Open the file in vim ($ vim supertab.vmb). 

"===================================================================================
" bufexplorer.zip : Buffer Explorer / Browser 
"===================================================================================
let g:bufExplorerDefaultHelp=0              " Do not show default help. 
let g:bufExplorerShowRelativePath=1         " Show relative paths. 
let g:bufExplorerSortBy='mru'               " Sort by most recently used. 
let g:bufExplorerSplitRight=0               " Split left. 
let g:bufExplorerSplitVertical=1            " Split vertically. 
let g:bufExplorerSplitVertSize = 30         " Split width 
let g:bufExplorerUseCurrentWindow=1         " Open in new window. 
autocmd BufWinEnter \[Buf\ List\] setl nonumber
map <F9> :BufExplorer<CR>

"===================================================================================
" Cscope
"===================================================================================
set cscopequickfix=s-,c-,d-,i-,t-,e-       "是否使用 quickfix 窗口来显示 cscope 结果
if has("cscope")
   set csprg=/usr/bin/cscope                "指定用来执行 cscope 的命令
   set csto=1                               "先搜索tags标签文件，再搜索cscope数据库
   set cst                                  "使用|:cstag|(:cs find g)，而不是缺省的:tag
   set nocsverb                             "不显示添加数据库是否成功
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out                     "添加cscope数据库
   endif
   set csverb                               "显示添加成功与否
endif
" 快捷键
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" 生成索引
"cd /usr/local/bin
"vi .codeindex
"#!/bin/sh
"find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.py" -o -name "*.cpp" > cscope.files
"cscope -bkq -i cscope.files
"ctags -R
"chmod a+x codeindex

"===================================================================================
" pylint.vim : compiler plugin for python style checking tool 
"===================================================================================
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0
map <F10> :Pylint<CR>


