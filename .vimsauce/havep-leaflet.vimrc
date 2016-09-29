set expandtab
set colorcolumn=120
map <leader><leader>a :!/usr/local/bin/ctags -f ./.vim.tags<CR>
exec 'NERDTree havep_leaflet'
set tags=./.vim.tags;/

let g:vdebug_options["port"] = 9000
let g:vdebug_options["server"] = '192.168.33.10'
let g:vdebug_options["path_maps"] = {'/vagrant': '/Volums/data/Projects/Intracto/Havep/havep_webplatform/htdocs'}

" syntastic
let g:syntastic_php_checkers = ['php']
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"let g:syntastic_php_phpcs_args = '--standard=vendor/kingfoo/coding-standards/KingFooStandards/'
"let g:syntastic_php_phpcs_exec = getcwd() . '/bin/phpcs'
"let g:syntastic_php_phpmd_exec = getcwd() . '/bin/phpmd'

set colorcolumn=120
