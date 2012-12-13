"定义路径变量
if has("win32")
    let $VIMFILES = $HOME.'/vimfiles'
    let $V = $HOME.'/_vimrc'

	"设置字体
	set guifont=Consolas:h10
else
    let $VIMFILES = $HOME.'/.vim'
    let $V = $HOME.'/.vimrc'
endif

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set nobomb

"语言设置
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set helplang=cn

"禁止生成临时文件
set nobackup

"始终显示行号
set nu!

"Tab键的宽度
set shiftwidth=4
set tabstop=4

"自动缩进
set ai!

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
set incsearch

"行内替换
set gdefault

"配色方案
colorscheme evening

"去除gvim的菜单栏和工具栏
set go=

"添加类型检测
filetype plugin indent on

"智能补全
set completeopt=longest,menu

"语法高亮
sy on

"搜索高亮
set hlsearch
map <ESC> :nohlsearch<cr>

"设置zencoding快捷键
let g:user_zen_settings = { 'indentation' : '    ', 'perl' : { 'aliases' : { 'req' : 'require ' }, 'snippets' : { 'use' : "use strict\nuse warnings\n\n", 'warn' : "warn \"|\";", } } }
let g:user_zen_expandabbr_key = '<c-e>'    "设置为ctrl+e展开
let g:use_zen_complete_tag = 1

"Nerdtree
map <F4> :NERDTreeToggle<CR>

"NERDTree Settings{
let NERDTreeWinPos ="left" "将NERDTree的窗口设置在gvim窗口的左边
let NERDTreeShowBookmarks=1 "当打开NERDTree窗口时，自动显示Bookmarks
let NERDTreeBookmarksFile=$VIMFILES."\\.NERDTreeBookmarks" "设置书签文件为VIM根目录
"}

"calendar
map <F7> :Calendar<cr>

"vimwiki
"map <S-F4> :VimwikiAll2HTML<cr>
"map <F4> :Vimwiki2HTML<cr>
let g:vimwiki_list = [{'path': 'D:/doc/', 'syntax': 'markdown', 'ext': '.md', 'diary_link_count': 5}]

"Taglist
let Tlist_Show_One_File = 1 "不同时显示多个文件的Tag，只显示当前文件
let Tlist_Exit_OnlyWindow = 1 "如果Taglist窗口是最后一个窗口时退出VIM
let Tlist_Use_Right_Window = 1 "让Taglist窗口在右侧显示
let Tlist_GainFocus_On_ToggleOpen = 1
"设置当执行TlistToggle时，定位当前光标到Tlist窗口
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'  "针对javascript
map <F3> :Tlist<CR>

" 重启后撤销历史可用 persistent undo 
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone

" indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 3

" php doc
source $VIMFILES/plugin/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
