set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"=---------------------------------------------------------------------------=
"=---------------------------------------------------------------------------=
"
" SYSTEM
"
"=---------------------------------------------------------------------------=
"=---------------------------------------------------------------------------=

" define path
if has("win32")
    let $VIMFILES = $HOME.'/vimfiles'
    let $V = $HOME.'/_vimrc'
else
    let $VIMFILES = $HOME.'/.vim'
    let $V = $HOME.'/.vimrc'
endif

let $VIMWIKI = $HOME.'/htdocs/cloud/doc/'

" encoding settings
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set nobomb

" language settings
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set helplang=cn

" forbid generating temp file
set nobackup

" persistent undo 
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone

"=---------------------------------------------------------------------------=
" style
"=---------------------------------------------------------------------------=

" scheme
colorscheme evening

" font

" font for MacVim
if has("gui_macvim")
	set guifont=Monaco:h15
	"set guifontwide=Hei:h15
endif

" font for gvim
if has("win32")
	set guifont=Consolas:h11
endif

" tab width
set shiftwidth=2
set tabstop=2

" auto indent
set ai!

" file type check
filetype plugin indent on

" syntax highlight
sy on

" auto complete
set completeopt=longest,menu

" hide top menu
set go=

" show line number
set nu!
hi LineNr guifg=#666666

" auto line break, support Chinese
"set tw=78 fo+=Mm
"set colorcolumn=79
"hi ColorColumn guibg=#354248

"=---------------------------------------------------------------------------=
" search & replace
"=---------------------------------------------------------------------------=
set ignorecase
set incsearch
set gdefault
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
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

"=---------------------------------------------------------------------------=
" Nerdtree
"=---------------------------------------------------------------------------=
map <F4> :NERDTreeToggle<CR>

let NERDTreeWinPos ="left" 
let NERDTreeShowBookmarks=1 
let NERDTreeBookmarksFile=$VIMFILES."\\.NERDTreeBookmarks" 
let NERDTreeIgnore=['node_modules']

"=---------------------------------------------------------------------------=
" vimwiki
"=---------------------------------------------------------------------------=
"vimwiki
let g:vimwiki_list = [
\	{
\		'path': $VIMWIKI.'vimwiki',
\		'nested_syntaxes': {
\			'py': 'python',
\			'glsl': 'glsl',
\			'js': 'javascript',
\			'java': 'java',
\			'php': 'php',
\			'html': 'html',
\			'css': 'css',
\			'less': 'less',
\			'sql': 'mysql'
\		},
\		'path_html': $VIMWIKI.'vimwiki/output/html',
\		'template_path': $VIMWIKI.'vimwiki/output/tpl/',
\		'template_default': 'common.htm',
\		'diary_link_count': 5
\	},
\	{
\		'template_default': 'common.htm', 
\		'path': $VIMWIKI.'vimark',
\		'syntax': 'markdown',
\		'ext': '.md',
\		'diary_link_count': 5
\	}
\]

"calendar
map <F7> :Calendar<cr>

" todo list
map <F8> :VimwikiToggleListItem<cr>

"=---------------------------------------------------------------------------=
" Taglist
"=---------------------------------------------------------------------------=
let Tlist_Show_One_File = 1 
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'  
map <F3> :Tlist<CR>

"=---------------------------------------------------------------------------=
" indent guide
"=---------------------------------------------------------------------------=
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 3

"=---------------------------------------------------------------------------=
" less
"=---------------------------------------------------------------------------=
au BufNewFile,BufRead *.less set filetype=css

"=---------------------------------------------------------------------------=
" typescript
"=---------------------------------------------------------------------------=
au BufNewFile,BufRead *.ts set filetype=javascript

"=---------------------------------------------------------------------------=
" processing
"=---------------------------------------------------------------------------=
map <F5> :make<cr>
