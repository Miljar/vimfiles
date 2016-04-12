set expandtab
set columns=120
set colorcolumn=120
nmap <F8> :TagbarToggle<CR>
map <leader><leader>a :!/usr/local/bin/ctags -f ./.vim.tags<CR>
"map <leader><leader>a :!/usr/bin/find . -name "*.php" \| /usr/local/bin/ctags -f ./.vim.tags -L - -R --extra=+f --exclude="\.svn" --exclude="\.git" --exclude="\.hg" --totals=yes --tag-relative=yes --fields=+afkst --PHP-kinds=+cf<CR>
exec 'NERDTree selenium'
"exec '!/usr/local/bin/ctags -R -f ./.git/tags .'
"exec '!/usr/bin/find . -name "*.php" | /usr/local/bin/ctags -f ./.vim.tags -L - -R --extra=+f --exclude="\.svn" --exclude="\.git" --exclude="\.hg" --totals=yes --tag-relative=yes --fields=+afkst --PHP-kinds=+cf'
set tags=./.vim.tags;/
