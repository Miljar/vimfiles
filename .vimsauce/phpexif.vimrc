set expandtab
set colorcolumn=120
map <leader><leader>a :!/usr/local/bin/ctags -f ./.vim.tags<CR>
exec 'NERDTree phpexif'
set tags=./.vim.tags;/

" syntastic
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--standard=PSR2'
let g:syntastic_php_phpcs_exec = getcwd() . '/vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = getcwd() . '/vendor/bin/phpmd'

" Padawan
let g:padawan#composer_command = 'composer'
