" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

call plug#begin('~/.vimfiles/plugged')

" UNITE STUFF
Plug 'Shougo/Unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"Plug 'Shougo/deoplete.nvim'
Plug 'rstacruz/vim-fastunite'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'

" COLOR SCHEMES
Plug 'tomasr/molokai'

" UI STUFF
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'

" SEARCH
Plug 'rking/ag.vim'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" UTILITIES
Plug 'joonty/vim-sauce'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-markdown'
Plug 'rhysd/conflict-marker.vim'
Plug 'Raimondi/delimitMate'
Plug 'ludovicchabant/vim-gutentags'

" PHP CODE
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'evidens/vim-twig'
Plug 'docteurklein/vim-symfony'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'joonty/vdebug'
Plug '2072/PHP-Indenting-for-VIm', { 'for': ['php', 'twig']}
Plug 'vim-php/vim-php-refactoring', { 'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox'

call plug#end()

" colorscheme options:
"set background=dark
colorscheme molokai
let g:rehash256 = 1

" Autostart stuff
if has("autocmd")
	au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
	au FileType json setlocal equalprg=python\ -m\ json.tool\ -\ 2>/dev/null
endif

" show line numbers:
set number

" tabs & spaces settings:
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4

" remember 1000 commands in history:
set history=1000

set ruler		   " show cursorposition
set cursorline	   " highlight current line
set showcmd		   " display incomplete commands
set incsearch	   " incremental searching
set hlsearch	   " highlight searchresult
set scrolloff=4    " keep at least 4 lines above or below the cursor

" fileformat stuff
set fileformats=unix,dos
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1250,iso-8859-1

" number formats are standard in OCTAL
" this setting makes sure the number format is DECIMAL
set nrformats=

" new leader key
let mapleader = ","

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Duplicate ranges above / below current selection
vmap da "by'<"bP
vmap db "by'>"bp

" Save read-only files
cmap w!! w !sudo tee % >/dev/null

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" always use system clipboard
"set clipboard+=unnamedplus
set clipboard=unnamed


" Shortcut to rapidly toggle `set list`:
nmap <leader><leader>l :set list!<CR>

" Shortcut to toggle NERDTree:
nmap <leader><leader>t :NERDTreeToggle<CR>

" pretty print json
nmap <leader><leader>j :%!python -m json.tool<CR>

" Let the open root node be the CWD
let NERDTreeChDirMode=2

" indent guides
let g:indent_guides_start_level = 1

" Unite file search
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
	let g:unite_source_grep_command='ag'
	let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
	let g:unite_source_grep_recursive_opt=''
endif
"nnoremap <silent> <space>p :Unite -auto-resize file/async file_mru file_rec/async<cr>
call unite#custom#profile('default', 'context', {
\ 'start_insert': 1,
\ 'open': 'left'
\ })


" Syntastic
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]" "] " ignore angularjs directives as errors in the html
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
"let g:SuperTabDefaultCompletionType = '<C-n>'

" airline theme
let g:airline_theme='molokai'
" always display airline (default is only after a split)
set laststatus=2
" always needed after setting colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vimfiles/UltiSnips']

"PHPDocumentor For Vim
let g:pdv_template_dir = $HOME ."/.vimfiles/UltiSnips/pdv"
let g:pdv_cfg_Author = 'Tom Van Herreweghe <tom@king-foo.be>'
let g:pdv_cfg_ClassTags = ["author"]
nnoremap <leader><leader>d :call pdv#DocumentWithSnip()<CR>

" vim-php
let g:php_refactor_command='/usr/local/bin/php-refactor'
