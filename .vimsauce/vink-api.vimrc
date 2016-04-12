set expandtab
set colorcolumn=120
nmap <F8> :TagbarToggle<CR>
map <leader><leader>a :!/usr/local/bin/ctags -f ./.vim.tags<CR>
exec 'OpenSession vink-api'
exec 'NERDTree vink-api'
let g:session_autosave_periodic=2
set tags=./.vim.tags;/

let g:vdebug_options["port"] = 9000
let g:vdebug_options["server"] = '192.168.34.103'
let g:vdebug_options["path_maps"] = {'/vagrant': '/Users/tom/Projects/KingFoo/Vink/vink-sales'}

" syntastic
let g:syntastic_php_checkers = ['php', 'phpcs']
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--standard=vendor/kingfoo/coding-standards/KingFooStandards/'
let g:syntastic_php_phpcs_exec = getcwd() . '/bin/phpcs'
"let g:syntastic_php_phpmd_exec = getcwd() . '/bin/phpmd'

" Padawan
let g:padawan#composer_command = 'composer'
