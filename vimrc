"==============================================================================
" vim 内置配置
"==============================================================================

" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭，否则配置多了之后会很卡
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 关闭兼容模式
set nocompatible

set number " 设置绝对行号
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 自定义快捷键

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
vmap <M-c> "+yy
" n 模式下复制一行到系统剪切板
nmap <M-c> "+yy
" n 模式下粘贴系统剪切板的内容
nmap <M-v> "+p

" 修改默认的区域切换如ctrl+w+h 奇幻到左侧， 依次是 左右上下
nmap <M-h> <C-w>h
nmap <M-l> <C-w>l
nmap <M-k> <C-w>k
nmap <M-j> <C-w>j
" 作用和上面一样，只不过是使用的 Leader
nmap <Leader>h <C-w>h
nmap <Leader>l <C-w>l
nmap <Leader>k <C-w>k
nmap <Leader>j <C-w>j

"开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.php write


"==============================================================================
" 插件配置
"==============================================================================

" 插件开始的位置
call plug#begin('~/.vim/plugged')


Plug 'ctrlpvim/ctrlp.vim'

" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'

" 可以使 nerdtree Tab 标签的名称更友好些
Plug 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'


" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'

" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" 自动生成注释的插件
Plug 'scrooloose/nerdcommenter'

" 强大的文件搜索插件
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 格式化代码插件
" 这个插件特定语言需要额外支持， 比如格式化 json， 需要 js-beautify
" 安装可以 yay -S js-beautify(archlinux) 或者 npm install -g js-beautify
" 更多支持参考： https://github.com/Chiel92/vim-autoformat#default-formatprograms
Plug 'Chiel92/vim-autoformat'


" 插件结束的位置，插件全部放在此行上面
call plug#end()



"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_def_mapping_enabled = 1
let g:go_code_completion_enabled = 1


" 直接通过 go run 执行当前文件
autocmd FileType go nmap <leader>r :GoRun %<CR>

" go跳转定义重用当前窗口
let  g:godef_split=0
let g:godef_same_file_in_same_window=1

map <c-l> :CtrlPBuffer<CR>
map <c-m> :CtrlPMixed<CR>
map <c-x> :!
map <c-o> :b
map <c-d> :bd

set tabstop=4
set backspace=2
set hlsearch

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"==============================================================================
" NERDTree 插件
"==============================================================================

" 打开和关闭NERDTree快捷键
map <c-n> :NERDTreeToggle<CR>
" 打开文件时是否显示目录
let NERDTreeAutoCenter=0
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2

" 在终端启动vim时，共享NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1


"==============================================================================
"  majutsushi/tagbar 插件
"==============================================================================

" majutsushi/tagbar 插件打开关闭快捷键
nmap <F9> :TagbarToggle<CR>

let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }


"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
			\ }

let g:NERDTreeShowIgnoredStatus = 1
nmap <Leader>pwd :NERDTreeCWD<CR>

"==============================================================================
"  其他插件配置
"==============================================================================

" markdwon 的快捷键
map <silent> <F5> <Plug>MarkdownPreview
map <silent> <F6> <Plug>StopMarkdownPreview

" tab 标签页切换快捷键
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>

:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

" 自动注释的时候添加空格
let g:NERDSpaceDelims=1





"==============================================================================
" 光标随着插入模式改变形状
" 参考： https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
"==============================================================================
if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
	au InsertEnter,InsertChange *
				\ if v:insertmode == 'i' |
				\   silent execute '!echo -ne "\e[6 q"' | redraw! |
				\ elseif v:insertmode == 'r' |
				\   silent execute '!echo -ne "\e[4 q"' | redraw! |
				\ endif
endif


"==============================================================================
" 自定义的额外配置 
"==============================================================================
"
" 自动保存 session
autocmd VimLeave * mks! ~/.vim/session.vim
" 加载 session 的快捷键
nmap <Leader>his :source ~/.vim/session.vim<CR>

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-S-i> :Autoformat<CR>

" 自动切换到当前文件所在的目录 cdpath
map <Leader>cd :cd %:h<CR>

" 退出
map <Leader>q :q<CR>
map <Leader>wq :wq<CR>


"标签
let g:airline#extensions#tabline#enabled = 1

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set nonu
