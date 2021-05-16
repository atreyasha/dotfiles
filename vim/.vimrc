" add git submodule for code base
set runtimepath+=~/.vim_runtime

" source upstream defaults
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

" set spelling languages
set spelllang=en,de

" remove extra modeline
set noshowmode

" clipboard related changes
set clipboard=unnamedplus
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" line numbers
set number
set relativenumber
set numberwidth=3

" set text width
set tw=0

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab

" undo mappings with $ prefix to reduce delay
vunmap $1
vunmap $2
vunmap $3
vunmap $$
vunmap $q
vunmap $e
iunmap $1
iunmap $2
iunmap $3
iunmap $4
iunmap $q
iunmap $e

" set modal cursor
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

" timeout for mode change
set ttimeout ttimeoutlen=0

" highlight line numbers
set cursorline
highlight LineNr term=NONE cterm=NONE ctermfg=Grey ctermbg=NONE
highlight CursorLineNr term=bold cterm=bold ctermbg=0
highlight CursorLine term=NONE cterm=NONE ctermbg=0

" disable linting by default
let g:ale_enabled = 0

" workaround for bug in search where lines get duplicated
" see https://github.com/vim/vim/issues/5805 for bug report and workaround 
autocmd! CursorMoved * execute "let s:temporaryBool = v:hlsearch" | execute "let v:hlsearch = 0" | execute "let v:hlsearch = s:temporaryBool"

" mail filetype text width, need additional command to prevent filetype override
autocmd FileType mail setlocal tw=0

" remove close button and add pipe separators in lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}',
      \   'close': ''
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" temporary fix for https://github.com/amix/vimrc/issues/635
let g:snipMate = { 'snippet_version' : 1 }
