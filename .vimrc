" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

if has('python3')
  silent! python3 1
endif

call plug#begin('~/.vimfiles/plugged')

" Denite stuff
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'iyuuya/denite-ale'

" Deoplete stuff
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" COLOR SCHEMES
Plug 'lifepillar/vim-solarized8'
Plug 'jacoborus/tender'

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
Plug 'tpope/vim-abolish'
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'suan/vim-instant-markdown'
Plug 'cohama/lexima.vim'
Plug 'junegunn/vim-easy-align'
Plug 'matze/vim-move'
"Plug 'kburdett/vim-nuuid.git'

" PHP CODE
"Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'evidens/vim-twig'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
"Plug 'elythyr/pdv', { 'branch': 'improvements' }
"Plug 'joonty/vdebug', { 'branch': 'master' }
"Plug '2072/PHP-Indenting-for-VIm', { 'for': ['php', 'twig']}
Plug 'phpactor/phpactor', { 'do': 'composer install', 'branch': 'develop' }
Plug 'kristijanhusak/deoplete-phpactor'

call plug#end()

" colorscheme options:
"colorscheme solarized8_dark
set background=dark
colorscheme solarized8
"let macvim_skip_colorscheme=1
"let g:rehash256 = 1

" Autostart stuff
if has("autocmd")
	au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
	au FileType json setlocal equalprg=python\ -m\ json.tool\ -\ 2>/dev/null
    autocmd FileType php setlocal omnifunc=phpactor#Complete
    au FileType gitcommit set tw=120
endif

" show line numbers:
set number

" enable mouse
set mouse=a

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Insert UUID
nmap <Leader><Leader>U :r !uuidgen<CR>

" Clear search highlights
nmap <silent> ./ :nohlsearch<CR>

" DEOPLETE
let g:deoplete#enable_at_startup = 1

" ALE
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 0 " sign gutter open always
let g:airline#extensions#ale#enabled = 1 " airline integration

" PHPActor
nmap <Leader><Leader>i :call phpactor#UseAdd()<CR>
nmap <Leader><Leader>e :call phpactor#ClassExpand()<CR>
nmap <Leader><Leader>pp :call phpactor#ContextMenu()<CR>
nmap <Leader><Leader>o :call phpactor#GotoDefinition()<CR>
nmap <Leader><Leader>pd :call phpactor#OffsetTypeInfo()<CR>
nmap <Leader><Leader>pfm :call phpactor#MoveFile()<CR>
nmap <Leader><Leader>pfc :call phpactor#CopyFile()<CR>
nmap <Leader><Leader>tt :call phpactor#Transform()<CR>
nmap <Leader><Leader>cc :call phpactor#ClassNew()<CR>
nmap <Leader><Leader>fr :call phpactor#FindReferences()<CR>
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

" Show information about "type" under cursor including current frame
nnoremap <silent><Leader><Leader>pd :call phpactor#OffsetTypeInfo()<CR>

" Denite
  call denite#custom#option('default', {
        \ 'prompt': '❯'
        \ })

  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', ''])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
        \'noremap')
  call denite#custom#map('normal', '<Esc>', '<NOP>',
        \'noremap')
  call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
        \'noremap')
  call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
        \'noremap')
  call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
        \'noremap')
  call denite#custom#map('normal', '<Down>', '<denite:move_to_next_line>',
        \'noremap')
  call denite#custom#map('normal', '<Up>', '<denite:move_to_previous_line>',
        \'noremap')
nnoremap <C-p> :Denite file_rec<cr>
nnoremap <C-m> :Denite file_mru<cr>
nnoremap <C-g> :Denite grep<cr>
nnoremap <C-s> :DeniteCursorWord grep<cr>

" GitGutter
let g:gitgutter_sign_added = '■'
let g:gitgutter_sign_modified = '■'
let g:gitgutter_sign_removed = '■'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'

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

" Supertab
"let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

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
"let g:pdv_template_dir = $HOME ."/.vimfiles/UltiSnips/pdv"
let g:pdv_template_dir = $HOME ."/.vimfiles/plugged/pdv/templates_snip"
"let g:pdv_cfg_Author = 'Tom Van Herreweghe <tom@king-foo.be>'
"let g:pdv_cfg_ClassTags = ["author"]
nnoremap <leader><leader>d :call pdv#DocumentWithSnip()<CR>

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

nmap <leader><leader>su mugg/use<CR>vip:sort u<CR>:nohlsearch<CR>'u

" PHP stuff
set expandtab
set colorcolumn=120

" vim-move
let g:move_key_modifier = 'C'

" Vdebug defaults
let g:vdebug_options = {
    \'path_maps': {'/phpapp': getcwd()}
\}
