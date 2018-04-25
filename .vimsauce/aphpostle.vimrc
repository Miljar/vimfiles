exec 'NERDTree aphpostle'

"let g:vdebug_options["port"] = 9000
"let g:vdebug_options["server"] = '192.168.65.2'
"let g:vdebug_options["path_maps"] = {'/phpapp': '/Users/tom/Code/Dx/denp/denp-code'}

" syntastic
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"let g:syntastic_php_phpcs_args = '--standard=PSR2'
"let g:syntastic_php_phpcs_exec = getcwd() . '/../denp-infra/bin/php vendor/bin/phpcs'
"let g:syntastic_php_phpmd_exec = getcwd() . '/../denp-infra/bin/php vendor/bin/phpmd'

" ALE - PHPSTAN
let g:ale_php_phpstan_level = 1

" ALE - PHPCS
let g:ale_php_phpcs_standard = 'PSR2'

" PHPActor
" Specify a different PHP binary to use when calling Phpactor
" let g:phpactorPhpBin = getcwd() . '/../denp-infra/bin/php'


"let php_folding=1
"set foldmethod=syntax
"set foldnestmax=2

"set tags=.vim.tags
