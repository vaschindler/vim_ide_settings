set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'

let g:SimpylFold_docstring_preview=1

"Python auto indentation
au BufNewFile,BufRead *.py
    \ set tabstop=3
    \ set softtabstop=3
    \ set shiftwidth=3
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"remove unused whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"Autocompletion
Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" check syntax
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
call togglebg#map("<F5>")

"file tree
Plugin 'scrooloose/nerdtree'
"tabs
Plugin 'jistr/vim-nerdtree-tabs'
"ignore pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"search
Plugin 'kien/ctrlp.vim'

set nu

"git integration
Plugin 'tpope/vim-fugitive'

"powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"system clipboard
set clipboard=unnamed

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd vimenter * NERDTree

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'




