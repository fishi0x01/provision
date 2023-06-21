" Some default settings
set number
syntax on
set mouse=a
set clipboard=unnamedplus " Use system clipboard -- might require 'vim-gtk'
set encoding=utf-8
set backspace=indent,eol,start " Make backspace work with 'youcompleteme'

" Jenkinsfile
au BufNewFile,BufRead Jenkinsfile setf groovy

" Makefile
autocmd FileType make setlocal noexpandtab

" Footer
set laststatus=2
set statusline=%{FugitiveStatusline()}\ [%F]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v,%p%%]
set ts=4
set expandtab
set modelines=0
set nomodeline

" Nerdree
let NERDTreeQuitOnOpen=0

" Custom commands
cmap ide NERDTree \| VimuxRunCommand('')<CR>

" vim-clang-format plugin
let g:clang_format#style_options = {
            \ "IndentWidth" : 4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "c++17",
            \ "BreakBeforeBraces" : "Stroustrup"}
" Turn on auto-formatting c code
" autocmd FileType c,cpp,arduino ClangFormatAutoEnable

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pylint', 'python3']
let g:syntastic_dockerfile_checkers = ['hadolint']
