if filereadable(expand('$HOME/.vim/autoload/plug.vim'))
    call plug#begin('$HOME/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'easymotion/vim-easymotion'
    Plug 'vim-scripts/L9'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'briancollins/vim-jst'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'plasticboy/vim-markdown'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-fugitive'
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'Chiel92/vim-autoformat'
    Plug 'flazz/vim-colorschemes'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-surround'
    Plug 'nsf/gocode', {'rtp': 'vim/'}
    Plug 'fatih/vim-go'
if !filereadable(expand("$HOME/.vimrc_google"))
    Plug 'Valloric/YouCompleteMe'
endif
    call plug#end()    
else
    echomsg 'Vim Plug is not installed. You can install Vim Plug'
          \ 'from https://github.com/junegunn/vim-plug'
endif

if filereadable(expand("$HOME/.vimrc_google"))
  source $HOME/.vimrc_google
endif

" Automatically change the working path to the path of the current file
" autocmd BufNewFile,BufEnter * silent! lcd %:p:h

" Visual settings
set number
syntax on
set background=dark
colorscheme hybrid
filetype plugin on
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
map <Leader>nf :NERDTreeFind<CR>
" autocmd vimenter * if !argc() | NERDTree | endif

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
map <Leader>c :FufFileWithCurrentBufferDir<CR>
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

" Helpers to move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

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
