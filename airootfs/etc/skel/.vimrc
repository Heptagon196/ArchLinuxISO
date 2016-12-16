call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'vim-scripts/AutoComplPop'
Plug 'Rip-Rip/clang_complete'
Plug 'airblade/vim-gitgutter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'spf13/vim-colors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-markdown'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
call plug#end()

let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tab_nr=0
let g:tagbar_compact=1
let g:clang_complete_copen=1
let g:clang_library_path='/usr/lib/libclang.so.3.9'
let g:clang_user_options='-stdlib=libc++ -std=c++11 -I/usr/include/c++/6.2.1 -I/usr/include/c++/6.2.1/i686-pc-linux-gnu -I/usr/include -I/usr/include/bits'
let g:clang_auto_select=1
let g:clang_complete_auto=1
"let g:clang_snippets=1
"let g:clang_conceal_snippets=1
let g:clang_close_preview=1
let g:clang_complete_patterns=1
let g:clang_sort_algo='alpha'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=20
let g:tagbar_width=20
let g:undotree_SplitWidth=20
let g:indent_guides_enable_on_vim_startup=1
let g:AutoPairsMapCR=0
let g:plug_window='edit new'
let g:acp_behaviorKeywordLength=5
let g:airline#extensions#ycm#enable=1
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_use_utilsnips_completer=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1	

set backspace=indent,eol,start
set cindent
set wrap
set nospell
set cursorline
set nu
set background=light
set nospell
set wildmenu
set laststatus=2
set undolevels=1000
set undoreload=10000
set undofile
set undodir=$HOME/.vimundo/
set tabstop=4
set shiftwidth=4
set incsearch
set completeopt-=preview

syntax on
color solarized
hi Normal ctermbg=white ctermfg=0

let mapleader=','
map ; :
map <leader>e :NERDTreeToggle<CR>
map <leader>t :TagbarToggle<CR>
map <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
map <leader><tab> :bn<CR>
map <leader>s<tab> :bp<CR>
map <C-l> <C-w><C-w>
map <C-h> <C-w><C-w>
noremap j gj
noremap k gk
noremap <Up> g<Up>
noremap <Down> g<Down>
imap <silent><CR> <CR><Plug>AutoPairsReturn

if has('nvim')
	tnoremap <Esc> <C-\><C-n>
endif

"let g:acp_behavior={
			"\ 'c': 		[],
			"\ 'cpp': 	[],
			"\}
"call add(g:acp_behavior.c, {
			"\ 	'command': 		"\<C-x>\<C-u>",
			"\ 	'completefunc': "ClangComplete",
			"\ 	'meets': 		"acp#meetsForKeyword",
			"\ 	'repeat': 		0,
			"\})
"call add(g:acp_behavior.cpp, {
			"\ 	'command': 		"\<C-x>\<C-u>",
			"\ 	'completefunc': "ClangComplete",
			"\ 	'meets': 		"acp#meetsForKeyword",
			"\ 	'repeat': 		0,
			"\})
