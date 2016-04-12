set expandtab
set colorcolumn=120
nmap <F8> :TagbarToggle<CR>
map <leader><leader>a :!/usr/local/bin/ctags -f ./.vim.tags<CR>
exec 'NERDTree pollio'
set tags=./.vim.tags;/
