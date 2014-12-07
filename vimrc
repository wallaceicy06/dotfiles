" Begin vundle configuration

" Vundle help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

" my bundles here
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/ScrollColors'
Bundle 'tomasr/molokai'
Bundle 'nanotech/jellybeans.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/candycode.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'altercation/vim-colors-solarized'
Bundle 'sickill/vim-monokai'
Bundle 'w0ng/vim-hybrid'
Bundle 'vim-scripts/Wombat'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'

call vundle#end()

" End of vundle configuration

" Visual settings 
set number
syntax on
filetype plugin indent on
colorscheme hybrid
set hlsearch
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Spacing and tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" General key mappings
let mapleader = ","
set pastetoggle=<F4>

" NERDTree options
map <Leader>n :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif

" Theme changer
"map <C-n> :NEXTCOLOR<CR>
"map <C-p> :PREVCOLOR<CR>

" EasyMotion options 
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" FuzzyFinder options 
map <Leader>f :FufFile<CR>
map <Leader>b :FufBuffer<CR>
