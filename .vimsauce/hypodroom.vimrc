set expandtab
set colorcolumn=120
nmap <F8> :TagbarToggle<CR>
map <leader><leader>a :!/usr/local/bin/ctags -f ./.vim.tags<CR>
exec 'OpenSession hypodroom'
exec 'NERDTree hypodroom'
let g:session_autosave_periodic=2
set tags=./.vim.tags;/

let g:vdebug_options["port"] = 9000
let g:vdebug_options["server"] = '192.155.96.1'
let g:vdebug_options["path_maps"] = {'/vagrant': '/Users/tom/Projects/KingFoo/Hypotheekwinkel/hypodroom'}

" syntastic
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--standard=vendor/kingfoo/coding-standards/Standards/KingFoo/'
let g:syntastic_php_phpcs_exec = getcwd() . '/bin/phpcs'
let g:syntastic_php_phpmd_exec = getcwd() . '/bin/phpmd'

" Padawan
let g:padawan#composer_command = 'composer'
