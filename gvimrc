if has("gui_macvim")
  echo "Settings for MacVim"
  set transparency=0
  set guifont=Inconsolata\ for\ Powerline:h14
elseif has("gui_running")
  echo "Settings for GVim"
  set guifont=Inconsolata\ for\ Powerline\ Medium\ 12"
endif
