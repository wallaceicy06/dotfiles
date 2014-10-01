" vundle management
" 
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

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
Bundle 'Floobits/floobits-vim'

" go
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

" visual
set number
syntax on
filetype plugin indent on
colorscheme ron 
set hlsearch
set colorcolumn=80

" show whitespace as periods
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" key mappings
let mapleader = ","
map <Leader>n :NERDTreeToggle<CR>
set pastetoggle=<F4>
"map <C-n> :NEXTCOLOR<CR>
"map <C-p> :PREVCOLOR<CR>
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <Leader>f :FufFile<CR>
map <Leader>b :FufBuffer<CR>

" NERDTree options
autocmd vimenter * if !argc() | NERDTree | endif
