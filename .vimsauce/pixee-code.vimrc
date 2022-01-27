exec 'NERDTree pixee-code'

" syntastic
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"let g:syntastic_php_phpcs_args = '--standard=PSR2'
"let g:syntastic_php_phpcs_exec = getcwd() . '/../denp-infra/bin/php vendor/bin/phpcs'
"let g:syntastic_php_phpmd_exec = getcwd() . '/../denp-infra/bin/php vendor/bin/phpmd'

" ALE - PHPSTAN
let g:ale_php_phpstan_level = 1
"let g:ale_linters = ['phpcs', 'phpstan']

" ALE - PHPCS
let g:ale_php_phpcs_standard = 'PSR2'

let g:ale_completion_enabled = 0


" PHPActor
" Specify a different PHP binary to use when calling Phpactor
let g:phpactorPhpBin = '/usr/bin/php'
"let g:phpactorPhpBin = getcwd() . '/../denp-infra/bin/php'


"let php_folding=1
"set foldmethod=syntax
"set foldnestmax=2
