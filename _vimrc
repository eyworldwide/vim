"=---------------------------------------------------------------------------=
"=---------------------------------------------------------------------------=
"
" SYSTEM
"
"=---------------------------------------------------------------------------=
"=---------------------------------------------------------------------------=

"定义路径变量
if has("win32")
    let $VIMFILES = $HOME.'/vimfiles'
    let $V = $HOME.'/_vimrc'
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

"重启后撤销历史可用 persistent undo 
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone

"MacVim
if has("gui_macvim")

	"按 \\ 切换全屏
	let s:lines=&lines
	let s:columns=&columns

	func! FullScreenEnter()
		set lines=999 columns=999
		set fu
	endf

	func! FullScreenLeave()
		let &lines=s:lines
		let &columns=s:columns
		set nofu
	endf

	func! FullScreenToggle()
		if &fullscreen
			call FullScreenLeave()
		else
			call FullScreenEnter()
		endif
	endf

	nmap <Leader><Leader>  :call FullScreenToggle()<cr>
endif

"=---------------------------------------------------------------------------=
" style
"=---------------------------------------------------------------------------=

"配色方案
colorscheme evening

"设置字体

" MacVim下的字体配置
if has("gui_macvim")
	set guifont=Monaco:h15
	set guifontwide=Hei:h15
endif

" gvim下的字体配置
if has("win32")
	set guifont=Consolas:h11
endif

"Tab键的宽度
set shiftwidth=4
set tabstop=4

"自动缩进
set ai!

"添加类型检测
filetype plugin indent on

"语法高亮
sy on

"智能补全
set completeopt=longest,menu

"去除菜单栏和工具栏
set go=

"始终显示行号
set nu!
hi LineNr guifg=#666666

"自动换行 支持中文
set tw=78 fo+=Mm
set colorcolumn=79
hi ColorColumn guibg=#354248

"=---------------------------------------------------------------------------=
" search
"=---------------------------------------------------------------------------=

"忽略大小写
set ignorecase

"搜索逐字符高亮
set incsearch

"行内替换
set gdefault

"搜索高亮
set hlsearch
map <ESC> :nohlsearch<cr>

"=---------------------------------------------------------------------------=
"=---------------------------------------------------------------------------=
"
" PLUGINS
"
"=---------------------------------------------------------------------------=
"=---------------------------------------------------------------------------=

"=---------------------------------------------------------------------------=
" zencoding
"=---------------------------------------------------------------------------=
let g:user_zen_settings = {
\	'indentation' : '    ',
\	'perl' : {
\		'aliases' : {
\			'req' : 'require '
\		},
\		'snippets' : {
\			'use' : "use strict\nuse warnings\n\n", 
\			'warn' : "warn \"|\";" 
\		}
\	}
\}
let g:user_zen_expandabbr_key = '<c-e>'    "设置为ctrl+e展开
let g:use_zen_complete_tag = 1

"=---------------------------------------------------------------------------=
" Nerdtree
"=---------------------------------------------------------------------------=
map <F4> :NERDTreeToggle<CR>

"将NERDTree的窗口设置在窗口的左边
let NERDTreeWinPos ="left" 

"当打开NERDTree窗口时，自动显示Bookmarks
let NERDTreeShowBookmarks=1 

"设置书签文件为VIM根目录
let NERDTreeBookmarksFile=$VIMFILES."\\.NERDTreeBookmarks" 

"=---------------------------------------------------------------------------=
" vimwiki
"=---------------------------------------------------------------------------=
"vimwiki
let g:vimwiki_list = [
\	{
\		'path': $HOME.'/ku/doc/vimwiki',
\		'nested_syntaxes': {
\			'py': 'python',
\			'js': 'javascript',
\			'php': 'php',
\			'html': 'html',
\			'css': 'css',
\			'less': 'less',
\			'sql': 'mysql'
\		},
\		'path_html': $HOME.'/ku/doc/vimwiki/output/html',
\		'template_path': $HOME.'/ku/doc/vimwiki/output/tpl/',
\		'template_default': 'common.htm',
\		'diary_link_count': 5
\	},
\	{
\		'template_default': 'common.htm', 
\		'path': $HOME.'/ku/doc/vimark',
\		'syntax': 'markdown',
\		'ext': '.md',
\		'diary_link_count': 5
\	}
\]

"calendar
map <F7> :Calendar<cr>

" todo list
map <F12> :VimwikiToggleListItem<cr>

"=---------------------------------------------------------------------------=
" Taglist
"=---------------------------------------------------------------------------=
"不同时显示多个文件的Tag，只显示当前文件
let Tlist_Show_One_File = 1 

"如果Taglist窗口是最后一个窗口时退出VIM
let Tlist_Exit_OnlyWindow = 1 

 "让Taglist窗口在右侧显示
let Tlist_Use_Right_Window = 1

"设置当执行TlistToggle时，定位当前光标到Tlist窗口
let Tlist_GainFocus_On_ToggleOpen = 1

"针对javascript
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'  

"设置快捷键
map <F3> :Tlist<CR>


"=---------------------------------------------------------------------------=
" indent guide
"=---------------------------------------------------------------------------=
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 3

"=---------------------------------------------------------------------------=
" php doc
"=---------------------------------------------------------------------------=
source $VIMFILES/plugin/php-doc.vim 
inoremap <F6><ESC>:call PhpDocSingle()<CR> 
nnoremap <F6> :call PhpDocSingle()<CR> 
vnoremap <F6> :call PhpDocRange()<CR> 

"=---------------------------------------------------------------------------=
" less
"=---------------------------------------------------------------------------=
au BufNewFile,BufRead *.less set filetype=less
