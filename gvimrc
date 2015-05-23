if has("gui_macvim")
  macmenu &File.Print key=<nop>
  map <D-p>   :CtrlPClearCache<CR>\|:CtrlP<CR>
  map <D-/>   :Commentary<CR>
endif
