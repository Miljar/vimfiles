exec 'NERDTree sbm-code'

"let g:vdebug_options["port"] = 9000
"let g:vdebug_options["server"] = '192.168.33.62'
"let g:vdebug_options["path_maps"] = {'/vagrant': '/Volumes/data/Projects/Intracto/BrusselsAirport/brussels_airport_cms'}

" syntastic
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--standard=PSR2'
let g:syntastic_php_phpcs_exec = getcwd() . '/../sbm-docker/bin/php vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = getcwd() . '/../sbm-docker/bin/php vendor/bin/phpmd'

"let php_folding=1
"set foldmethod=syntax
"set foldnestmax=2

set tags=.vim.tags
