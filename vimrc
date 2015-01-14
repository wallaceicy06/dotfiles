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
Bundle 'kchmck/vim-coffee-script'
Bundle 'briancollins/vim-jst'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'plasticboy/vim-markdown'

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
let g:vim_markdown_folding_disabled=1

" Mouse enabled for xterm shells
set mouse=a

" Theming for weird filetypes
"au BufNewFile,BufRead *.ejs set filetype=html

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

" Paste from yank register only
map <Leader>p "0p
map <Leader>P "0P

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

" A script for setting ts/sw/sts
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
