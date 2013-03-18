" Base on Gary Bernhardt's .vimrc file
" Use CtrlP instead of CommandT

set nocompatible | filetype indent plugin on | syn on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETUP Addons BY VAM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun SetupVAM()
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  exec 'set rtp+='.vam_install_path.'/vim-addon-manager'
  " let g:vim_addon_manager = { your config here see "commented version" example and help
  if !isdirectory(vam_install_path.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(vam_install_path, 1).'/vim-addon-manager'
  endif
  call vam#ActivateAddons([
      \ 'snipmate',
      \ 'snipmate-snippets',
      \ 'github:maxbrunsfeld/vim-yankstack',
      \ 'github:scrooloose/syntastic',
      \ 'github:scrooloose/nerdtree',
      \ 'github:jistr/vim-nerdtree-tabs',
      \ 'github:epmatsw/ag.vim',
      \ 'github:kien/ctrlp.vim',
      \ 'github:godlygeek/tabular',
      \ 'github:tpope/vim-rails',
      \ 'github:tpope/vim-markdown',
      \ 'github:tpope/vim-surround',
      \ 'github:tpope/vim-repeat',
      \ 'github:tpope/vim-endwise',
      \ 'github:tpope/vim-fugitive',
      \ 'github:tpope/vim-commentary',
      \ 'github:mattn/webapi-vim',
      \ 'github:mattn/gist-vim',
      \ 'github:tomtom/quickfixsigns_vim',
      \ 'github:myusuf3/numbers.vim',
      \ 'github:bkad/CamelCaseMotion',
      \ 'github:docunext/closetag.vim',
      \ 'github:vim-scripts/matchit.zip',
      \ 'github:vim-scripts/ruby-matchit',
      \ 'github:kana/vim-textobj-user',
      \ 'github:nelstrom/vim-textobj-rubyblock',
      \ 'github:kchmck/vim-coffee-script',
      \ 'github:gkz/vim-ls',
      \ 'github:nono/vim-handlebars',
      \ 'github:tpope/vim-haml',
      \ 'github:vim-ruby/vim-ruby'
      \ ], {'auto_install' : 1})
endf
call SetupVAM()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENCODING SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
set ffs=unix,mac,dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FONT AND COLOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set gfn=Source\ Code\ Pro\ Light:h14

:set t_Co=256 " 256 colors
:set background=dark
:colorscheme smyck

highlight Pmenu ctermbg=94 guibg=#875F00
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set wrap
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" insert tabs on the start of a line according to context
set smarttab
" highlight current line
set cursorline
set cursorcolumn
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=79
" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" show the cursor wposition all the time
set ruler
" auto read when file is changed from outsideyy
set autoread
" This makes RVM work inside Vim. I have no idea why.
set shell=zsh
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=7
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" display incomplete commands
set showcmd
" For regular expressions turn magic on
set magic
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
" set folding method by syntax
set foldmethod=syntax
set foldlevelstart=20
set showbreak=↪
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHOW INVISIBLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


  " make CSS omnicompletion work for SASS and SCSS
  autocmd BufNewFile,BufRead *.json             set ft=javascript
  autocmd BufNewFile,BufRead *.coffee           set ft=coffee
  autocmd! BufNewFile,BufRead *.scss,*.sass      set ft=scss.css
  autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
  autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/vim-addons/github-docunext-closetag.vim/plugin/closetag.vim
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,coffee,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et
  " Indent p tags
  autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif
  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Enable omni completion. (Ctrl-X Ctrl-O)
  autocmd FileType html,haml,markdown,handlebars setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapNoHighlight()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM FILE COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Sudow w !sudo tee % > /dev/null
command! -nargs=1 F setf <args>
command! Fj setf javascript
command! -nargs=1 I exec ":silent !iterm_exec '" . <args>  . "'"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASH LIKE KEYS FOR THE COMMANDLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C->

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RESIZE SPLIT WINDOW
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Up> :res +2<cr>
map <Down> :res -2<cr>
map <Right> :vertical res +2<cr>
map <Left> :vertical res -2<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

set laststatus=2
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j<c-w>_
nnoremap <c-k> <c-w>k<c-w>_
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
set winheight=5
set winminheight=5
set equalalways
set eadirection=both
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Clear the search buffer when hitting return
function! MapNoHighlight()
  map <leader>. :nohlsearch<cr>
endfunction
call MapNoHighlight()
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
nnoremap <leader><leader> <c-^>
" format json
map <leader>j !python -m json.tool<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
"map <leader>e :edit %%
"map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>l :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
vnoremap <leader>rv :call ExtractVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    :let l:tmp_a = @a
    :normal "ayiw
    " Delete variable and equals sign
    :normal 2daW
    " Delete the expression into the 'b' register
    :let l:tmp_b = @b
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . @b
    :let @a = l:tmp_a
    :let @b = l:tmp_b
endfunction
nnoremap <leader>ri :call InlineVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC CtrlP TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction

map <leader>gR :call ShowRoutes()<cr>
map <leader>gv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>gc :CtrlPClearCache<cr>\|:CtrlP app/controllers<cr>
map <leader>gm :CtrlPClearCache<cr>\|:CtrlP app/models<cr>
map <leader>gh :CtrlPClearCache<cr>\|:CtrlP app/helpers<cr>
map <leader>ga :CtrlPClearCache<cr>\|:CtrlP app/assets<cr>
map <leader>gs :CtrlPClearCache<cr>\|:CtrlP spec/<cr>
map <leader>gl :CtrlPClearCache<cr>\|:CtrlP lib<cr>
map <leader>gp :CtrlPClearCache<cr>\|:CtrlP public<cr>
map <leader>gf :CtrlPClearCache<cr>\|:CtrlP features<cr>
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gt :CtrlPClearCache<cr>\|CtrlPTag<cr>
map <leader>f :CtrlPClearCache<cr>\|:CtrlP<cr>
map <leader>F :CtrlPClearCache<cr>\|:CtrlP %%<cr>
map <leader>z z5<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! OpenTestAlternate()
"   let new_file = AlternateForCurrentFile()
"   exec ':e ' . new_file
" endfunction
" function! AlternateForCurrentFile()
"   let current_file = expand("%")
"   let new_file = current_file
"   let in_spec = match(current_file, '^spec/') != -1
"   let going_to_spec = !in_spec
"   let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
"   if going_to_spec
"     if in_app
"       let new_file = substitute(new_file, '^app/', '', '')
"     end
"     let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
"     let new_file = 'spec/' . new_file
"   else
"     let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
"     let new_file = substitute(new_file, '^spec/', '', '')
"     if in_app
"       let new_file = 'app/' . new_file
"     end
"   endif
"   return new_file
" endfunction
" nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TEST IN ITERM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_terminal="/dev/ttys000"
let g:use_zeus=0
map <leader><C-t> :let g:vim_terminal="/dev/ttys001"
map <leader><C-z> :let g:use_zeus=1<cr>

function! RunInTerminal(file)
  if g:use_zeus != 0
    let l:command = 'zeus test --color'
  elseif match(a:file, '_spec\.rb') != -1
    let l:command = 'bundle exec rspec --color'
  elseif match(a:file, '\.feature') != -1
    let l:command = 'bundle exec cucumber'
  elseif match(a:file, '\_test.rb') != -1
    let l:command = 'ruby -I./test'
  endif

  if exists("l:command")
    let g:last_run_in_terminal = a:file
    let l:run_script = "!osascript ~/.vim/tools/run_command.applescript"
    silent execute ":up"
    silent execute l:run_script . " '" . l:command . " " . a:file . "' " . g:vim_terminal . " &"
    silent execute ":redraw!"
  else
    echo "Couldn't figure out how to run " . a:file
  end
endfunction

function! RunFileInTerminal()
  if exists("g:vim_terminal")
    call RunInTerminal(expand("%"))
  else
    echo "You need to set g:vim_terminal to a valid TTY (e.g. /dev/ttys000)"
  end
endfunction
 
function! RunFileAtLineInTerminal()
  if exists("g:vim_terminal")
    call RunInTerminal(expand("%") . ":" . line("."))
  else
    echo "You need to set g:vim_terminal to a valid TTY (e.g. /dev/ttys000)"
  endif
endfunction

function! ReRunLastFileCommand()
  if exists("g:vim_terminal") && exists("g:last_run_in_terminal")
    call RunInTerminal(g:last_run_in_terminal)
  endif
endfunction

command! RunFileInTerminal call RunFileInTerminal()
command! RunFileAtLineInTerminal call RunFileAtLineInTerminal()
command! ReRunLastFileCommand call ReRunLastFileCommand()
",a stands for at line
map <leader>a :call RunFileAtLineInTerminal()<cr>
",t stand for test all file
map <leader>t :call RunFileInTerminal()<cr>
",r stand for repeat
map <leader>r :call ReRunLastFileCommand()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Md5 COMMAND
" Show the MD5 of the current buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -range Md5 :echo system('echo '.shellescape(join(getline(<line1>, <line2>), '\n')) . '| md5')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow multiple indentation/deindentation in visual mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" InsertTime COMMAND
" Insert the current time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interact with GUI clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addons Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- Numbers.vim
nnoremap <C-n> :NumbersToggle<cr>

" --- CtrlP
" sets local working directory as the nearest ancestor
" that contains one of these directories or files: .git/
let g:ctrlp_map = '<C-p>'
let g:ctrlp_working_path_mode = 'ra'

"exclude directories or files from the search
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.exe$\|\.so$\|\.dll$',
\ 'link': 'some_bad_symbolic_links',
\ }

" --- gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filytype = 1
let g:gist_open_browser_after_post = 1

" --- snipMate
let g:snips_trigger_key='<F3>'
imap <F2> <c-r><F3>

" --- yankstack
let g:yankstack_map_keys = 0
nmap <leader>m <Plug>yankstack_substitute_older_paste

" --- Tabular
"nmap <leader>b :Tab<cr>
"vmap <leader>b :Tab<cr>

" ---JavaScript Syntax
let g:javascript_enable_domhtmlcss = 1 "Enable html,css syntax Highlight in js

" ---NerdTree-Tabs
let g:nerdtree_tabs_open_on_gui_startup=0
map <F4> <plug>NERDTreeTabsToggle<cr>

" ---rails.vim
map <leader>u :Rtags<cr>

" Always edit file, even when swap file is found
set shortmess+=A

" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>d :call SearchDash()<CR>
