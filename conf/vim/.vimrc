" enable filetype settings
filetype plugin indent on

" source upstream defaults
source ~/.vim.d/basic.vim

" set colorscheme
colorscheme retrobox

" set spelling languages
set spelllang=en,de

" clipboard related changes
set clipboard=unnamedplus
if executable('xsel')
  autocmd VimLeave * call system("xsel -ib", getreg('+'))
endif

" set modal cursor
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

" timeout for mode change
set ttimeout ttimeoutlen=0

" misc. settings
set number
set relativenumber
set numberwidth=2
set shiftwidth=2
set tabstop=2
set tw=0
set expandtab
set cursorline

" enable persistent undo
set undofile
