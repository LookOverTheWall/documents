set nu
set tabstop=4
set expandtab
set cul
set showmatch   "光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set hlsearch    "搜索时，高亮显示匹配结果
set incsearch   "输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
"set spell spelllang=en_us "打开英语单词的拼写检查
set noerrorbells "出错时，不要发出响声
set visualbell  "出错时，发出视觉提示，通常是屏幕闪烁
set history=1000 "Vim 需要记住多少次历史操作

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

"->NERDTree目录树插件---配置选项=====================================================         
let g:NERDTreeDirArrowExpandable = '▸'  "目录图标
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd vimenter * NERDTree                "自动打开目录树
autocmd VimEnter * wincmd p                "自动将光标放在正文
"vim【无文件】也显示目录树 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"vim打开目录文件也显示目录树？
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene     | endif
"CRTL+N开关目录树
map <C-n> :NERDTreeToggle<CR>
"关闭最后一个文件，同时关闭目录树
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"<-NERDTree目录树插件---配置选项===============================================================

"ctags
set tags+=/usr/include/tags
set tags+=/tags
autocmd BufWritePost *.cpp,*.c,*.h :!ctags -R --sort=yes --c++ -kinds=+p --fields=+iaS --extra=+q

"tagbar
nmap <F3>tb :TagbarToggle<CR>  " 将开启tagbar的快捷键设置为　F3
let g:tagbar_ctags_bin='/usr/bin/ctags'  " 设置ctags所在路径
let g:tagbar_width=30 " 设置tagbar的宽度
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() " 在某些情况下自动打开tagbar

"YouCompleteMe config
"let g:ycm_server_python_interpreter='/usr/bin/python3.8'
"bal_ycm_extra_conf='/root/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 按,jd 会跳转到定义
"let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"let g:ycm_confirm_extra_conf=0   " 打开vim时不再询问是否加载ycm_extra_conf.py配置
"inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228) 
"let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件
