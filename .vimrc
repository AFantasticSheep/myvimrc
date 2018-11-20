"
"Personal perference .vimrc file
"Maintained by AFantasticSheep <aFatansy91@gmail.com> 
"

" Global settings {{{

" Use vim settings, rather then vi settings(much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

syntax on

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
let mapleader=","
let maplocalleader="\\"

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null
" }}}

" Vim behaviour {{{
" Sets how many lines of history VIM to remember
set history=500
set undolevels=1000
set nobackup 				" do not keep backup files
set noswapfile				" do not write annoying intermediate swap files
" set visualbell			" do not beep 
set autoread                " Set to auto read when a file is changed from the outside
set tags=./.tags;,.tags
set ignorecase
set smartcase
" }}}

" Editing behaviour {{{
set mouse=a					" mouse
set hlsearch				" highlight search terms
set ts=4					" a tab is four spaces
set sw=4					" number of spaces to use for autoindenting
" set expandtabs=4   			" expand tabs by default (overloadable per file type later)
set softtabstop=4			" when hitting <BS>, prtend like a tab is removed, even if spaces
set t_Co=256				" 
set nu					
set incsearch				" show search matches as you type
set nowrapscan
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]		
set autoindent
set ruler
set showcmd 
set showmode 				"show current mode
set path+=** 				"search include subdirectory
set wildmenu 				"use tab to show matched file
set clipboard=unnamedplus 	" normal OS clipboard interaction

"}}}

" maps {{{
" Common {{{
" Fast saving
nmap <C-S> :w!<cr>			
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
" }}}

" YouCompleteMe {{{
nnoremap <Leader>yt :YcmCompleter GoTo<CR>
nnoremap <Leader>yd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>ge :YcmCompleter GoToDeclaration<CR>
" }}}

" Unite {{{
" files
nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
nnoremap <silent><Leader>O :unite -silent -start-insert file_rec/async<CR>
nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
" buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>

" tabs
nnoremap <silent><Leader>B :Unite -silent tab<CR>

" buffer search
nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview line<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview line<CR>

" yanking
nnoremap <silent><Leader>i :Unite -silent history/yank<CR>

" help
nnoremap <silent> g<C-h> :uniteWithCursorWord -silent help<CR>

" tasks
nnoremap <silent><Leader>; :Unite -silent -toggle grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>

" outline (also ctags)
nnoremap <silent><Leader>t :Unite silent -vertical -winwidth=40 -direction=topleft -toggle outline<CR>

"INSERT
imap <silent> <buffer> <C-space> <Plug>(unite_toggle_mark_current_candidate)
"#imap <silent> <buffer> <Esc> <Plug>(unite_exit)
imap <silent> <buffer> <F5> <Plug>(unite_redraw)
imap <silent> <buffer> jk <Plug>(unite_insert_leave)
" imap <silent> <buffer> <Tab> <Plug>(unite_complete)
" }}}

" easymotion {{{
map <Leader><Leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j>
map <Leader><Leader>k <Plug>(easymotion-k>
map <Leader><Leader>l <Plug>(easymotion-lineforward)
" }}}

"NERDTree {{{
map <F3> :NERDTreeToggle<CR>
" }}}

" tagbar {{{
noremap <F8> :TagbarToggle<CR>
" }}}

" guentags {{{
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr> noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr> noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr> " }}}
"}}}

vmap <C-c> "+y


" Plug {{{
" Plugins will be download under the specified directory
call plug#begin('~/.vim/plugged')
	" Declare the list of plugins
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'Valloric/YouCompleteMe'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'Yggdroot/indentLine'
	Plug 'w0rp/ale'
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'SirVer/ultisnips'
	Plug 'skywind3000/gutentags_plus'
	Plug 'skywind3000/asyncrun.vim'
	Plug 'Shougo/unite.vim'
	Plug 'majutsushi/tagbar'
	Plug 'Shougo/unite-outline', {'autoload': {'unite_sources': 'outline'}}
	Plug 'tsukkee/unite-help', {'autoload': {'unite_sources': 'help'}}
	Plug 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources': 'colorscheme'}}
	Plug 'ujihisa/unite-locate', {'autoload':{'unite_sources' : 'locate'}}
	Plug 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources' : ['history/command', 'history/search']}}
	Plug 'osyo-manga/unite-filetype', { 'autoload' : {'unite_sources' : 'filetype', }}
	Plug 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources': ['quickfix', 'location_list']}}
	Plug 'osyo-manga/unite-fold', {'autoload':{'unite_sources':'fold'}}
	Plug 'tacroe/unite-mark', {'autoload':{'unite_sources':'mark'}}
	Plug 'tsukkee/unite-tag', {'autoload':{'unite_sources':'tag'}}
	Plug 'Shougo/neomru.vim', {'autoload':{'unite_sources': ['file_mru', 'directory_mru']}}
call plug#end()

" NERDTree {{{
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', 
		     \ '^\.git$', '__pycache__', '\.DS_Store']
" }}} 

" ALE {{{
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c+14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
" }}}

" YouCompleteMe {{{
set completeopt=longest,menu

" let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf=0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars=2
let g:ycm_collect_identifier_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_semantic_triggers = {
			\ 'c,cpp,python,java,go,erlang,perl':['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\}
let g:ycm_filetype_whitelist = {
			\ "c" : 1,
			\ "cpp" : 1,
			\ "python" : 1,
			\ "sh" : 1,
			\ "zsh" : 1,
			\ "go" : 1,
			\ "java" : 1
		\}

" }}}

" Unite {{{
" call unite#filter#matcher_default#use(['matcher_fuzzy'])
" call unite#filter#sorter_default#use(['sorter_rank'])
" call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate', 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_mes = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '>>>'
let g:unite_marked_icon = '✓'
let g:unite_winheight=15
let g:unite_update_time=200
let g:unite_split_rule = 'botright'
let g:unite_data_directory = expand('~/.vim/tmp/unite')
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g_unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g_unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
" }}}


" airline {{{
let g:airline_enabled = 1
let g:airline_powerline_fonts = 1 " }}}

" easymotion {{{
" }}}

" tagbar {{{
" }}}

" indentLine {{{
set list lcs=tab:\|\ 
let g:indentLine_enable = 1
let g:indentLine_char = '┆'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_color_tty_light = 7 "(default: 4)
let g:indentLine_color_dark = 1 "(default: 2)
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar= '.'
let g:vim_json_syntax_conceal = 0
" }}}

" gutentags & gutentags_plus {{{
let g:gutentags_module = ['ctags', 'gtags_cscope']
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cached_dir = expand('~/.cache/tags')

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_auto_add_gtags_cscope = 0
" }}}

" AsyncRun {{{
let g:asyncrun_open = 18
" }}}

" UtilSnips {{{
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger= "<tab>"
let g:UltiSnipsJumpBackwardTrigger= "<s-tab>"
"let g:UltiSnipsSnippetDirectories= ["snippets", "plugged/ultisnips/UltiSnips"]
let g:UltiSnipsEditSplit="vertical"
" }}}

" }}}
