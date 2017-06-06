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
Plug 'jacoborus/tender'
Plug 'lifepillar/vim-solarized8'

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
"Plug 'Raimondi/delimitMate'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-abolish'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'suan/vim-instant-markdown'
Plug 'cohama/lexima.vim'
Plug 'junegunn/vim-easy-align'
Plug 'matze/vim-move'

" PHP CODE
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
"Plug 'evidens/vim-twig'
"Plug 'docteurklein/vim-symfony'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'joonty/vdebug'
Plug 'joonty/vim-phpunitqf'
Plug '2072/PHP-Indenting-for-VIm', { 'for': ['php', 'twig']}
Plug 'vim-php/vim-php-refactoring', { 'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'shawncplus/phpcomplete.vim'

call plug#end()

" colorscheme options:
"set background=dark
colorscheme solarized8_dark
"let macvim_skip_colorscheme=1
"let g:rehash256 = 1

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

" Shortcut to run PHPUnit tests
nmap <leader><leader>p :Test<CR>

" pretty print json
nmap <leader><leader>j :%!python -m json.tool<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Custom Easy Align stuff:
let g:easy_align_delimiters = {
\ '$': {
\    'pattern': '\$'
\ }
\}

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
"let g:SuperTabDefaultCompletionType = '<c-n><c-p>'

" airline theme
let g:airline_theme='tender'
" always display airline (default is only after a split)
set laststatus=2
" always needed after setting colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled           = 1
let g:airline#extensions#tabline#show_buffers      = 1
let g:airline#extensions#tabline#buffer_idx_mode   = 1
" Just filename in the tabline
let g:airline#extensions#tabline#fnamemod          = ':t'
" Easier tab/buffer switching
nmap <leader>& <Plug>AirlineSelectTab1
nmap <leader>é <Plug>AirlineSelectTab2
nmap <leader>" <Plug>AirlineSelectTab3
nmap <leader>' <Plug>AirlineSelectTab4
nmap <leader>( <Plug>AirlineSelectTab5
nmap <leader>§ <Plug>AirlineSelectTab6
nmap <leader>è <Plug>AirlineSelectTab7
nmap <leader>! <Plug>AirlineSelectTab8
nmap <leader>ç <Plug>AirlineSelectTab9

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

" phpcomplete
let g:phpcomplete_mappings = {
   \ 'jump_to_def': ',g',
   \ 'jump_to_def_split': ',gs',
   \ 'jump_to_def_vsplit': ',gv',
   \}



let s:zoom_enabled = 0
function! ToggleZoomMode()
    if s:zoom_enabled
		:NERDTreeToggle
		execute "normal \<c-w>="
        let s:zoom_enabled = 0
    else
		:NERDTreeToggle
		execute "normal \<c-w>|"
        let s:zoom_enabled = 1
    endif
endfunction
nmap <leader><leader>z :call ToggleZoomMode()<CR><CR>

nmap <leader><leader>su mugg/use<CR>vip:sort u<CR>'u

" PHP stuff
set expandtab
set colorcolumn=120
map <leader><leader>a :let job=job_start("/usr/local/bin/ctags -f ./.vim.tags", {"in_io": "null", "out_io": "null", "err_io": "null"})<CR>
"set tags=./.vim.tags;/

" vim-move
let g:move_key_modifier = 'C'
