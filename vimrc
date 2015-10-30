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

Plugin 'gmarik/Vundle.vim'

" my bundles here
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/ScrollColors'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/candycode.vim'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-scripts/Wombat'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'kchmck/vim-coffee-script'
Plugin 'briancollins/vim-jst'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'plasticboy/vim-markdown'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Chiel92/vim-autoformat'

call vundle#end()

" End of vundle configuration

" Visual settings
set number
syntax on
set background=dark
colorscheme hybrid
filetype plugin indent on
set hlsearch
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
let g:vim_markdown_folding_disabled=1
set laststatus=2
" let g:airline_powerline_fonts=1

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
set backspace=2

" NERDTree options
map <Leader>n :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif

" NERDCommenter options
let NERDSpaceDelims=1

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

" Tagbar options
map <Leader>t :TagbarToggle<CR>
let g:tagbar_left = 1

" C formatting options
let g:formatprg_c = "astyle"
let g:formatprg_args_c = "--style=otbs"

" C++ formatting options
let g:formatprg_cpp = "astyle"
let g:formatprg_args_cpp = "--style=otbs"

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

