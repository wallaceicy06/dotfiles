if has("gui_macvim")
  set transparency=0
  set guifont=Inconsolata\ for\ Powerline:h14
elseif has("gui_running")
  set guifont=Liberation\ Mono\ 9
  set guioptions -=T
endif
