exec 'NERDTree phpexif-exiftool'

" syntastic
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--standard=PSR2'
let g:syntastic_php_phpcs_exec = getcwd() . '/vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = getcwd() . '/vendor/bin/phpmd'

"let php_folding=1
"set foldmethod=syntax
"set foldnestmax=2
