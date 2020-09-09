" Some default settings
set number
syntax on
set mouse=a
set clipboard=unnamedplus " Use system clipboard -- might require 'vim-gtk'
set encoding=utf-8
set backspace=indent,eol,start " Make backspace work with 'youcompleteme'

" Jenkinsfile
au BufNewFile,BufRead Jenkinsfile setf groovy

" Footer
set laststatus=2
set statusline=%{FugitiveStatusline()}\ [%F]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v,%p%%]
set ts=4
set expandtab
set modelines=0
set nomodeline

cmap ide NERDTree \| VimuxRunCommand('')<CR>
