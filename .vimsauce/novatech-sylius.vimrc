set expandtab
set colorcolumn=120
map <leader><leader>a :!/usr/local/bin/ctags -f ./.vim.tags<CR>
exec 'NERDTree novatech-sylius'
set tags=./.vim.tags;/

"let g:vdebug_options["port"] = 9000
"let g:vdebug_options["server"] = '192.168.34.101'
"let g:vdebug_options["path_maps"] = {'/vagrant': '/Users/tom/Projects/KingFoo/Vink/vink-sylius'}

" syntastic
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--standard=PSR2'
let g:syntastic_php_phpcs_exec = getcwd() . '/vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = getcwd() . '/vendor/bin/phpmd'
