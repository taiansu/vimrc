" By Taian Su
" http://blog.taian.su
" You can do what ever you want with this.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive',
Plug 'myusuf3/numbers.vim'
Plug 'kana/vim-submode'
Plug 'vim-scripts/matchit.zip'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'Konfekt/FastFold'
Plug 'reedes/vim-pencil'
Plug 'michaeljsmith/vim-indent-object'
Plug 'AndrewRadev/linediff.vim'

" Colorscheme
Plug 'chriskempson/base16-vim'
Plug 'reedes/vim-colors-pencil'

" with Dependency
function! InstallLints(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g coffeelint coffee-react-transform
  endif
endfunction

Plug 'scrooloose/syntastic',     { 'do': function('InstallLints') }

" On-demand loading
Plug 'tpope/vim-dispatch',       { 'on': ['Dispatch', 'Focus', 'Start'] }
Plug 'rizzatti/dash.vim',        { 'on': ['Dash', 'DashKeywords'] }
Plug 'itspriddle/vim-marked',    { 'on': 'MarkedOpen', 'for': 'markdown' }
Plug 'rking/ag.vim',             { 'on': 'Ag' }
Plug 'gabesoft/vim-ags',         { 'on': 'Ags' }
Plug 'junegunn/vim-easy-align',  { 'on': 'EasyAlign' }
Plug 'mattn/webapi-vim',         { 'on': 'Gist' }
Plug 'mattn/gist-vim',           { 'on': 'Gist' }
Plug 'ryanss/vim-hackernews',    { 'on': 'HackerNews' }
Plug 'rdnetto/YCM-Generator',    { 'branch': 'stable' }

" Lazy loading

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

Plug 'tpope/vim-endwise',        { 'on': [] }
Plug 'SirVer/ultisnips',         { 'on': [] }
Plug 'taiansu/vim-snippets',     { 'on': [] }
Plug 'Valloric/YouCompleteMe',   { 'on': [], 'do': function('BuildYCM') }

augroup load_lazy_plugins
  autocmd!
  autocmd InsertEnter * call plug#load('vim-endwise', 'ultisnips', 'vim-snippets', 'YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_lazy_plugins
augroup END

" Language specified
function! InstallTern(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction

function! InstallGoBinary(info)
  :GoInstallBinaries
endfunction

Plug 'marijnh/tern_for_vim',     { 'for': 'javascript', 'do': function('InstallTern') }
Plug 'pangloss/vim-javascript',  { 'for': 'javascript' }
Plug 'mxw/vim-jsx',              { 'for': ['javascript', 'html'] }
Plug 'tpope/vim-haml',           { 'for': 'haml' }
Plug 'nono/vim-handlebars',      { 'for': ['handlebars', 'handlebars.html'] }
Plug 'othree/html5.vim',         { 'for': 'html' }
Plug 'mattn/emmet-vim',          { 'for': 'html' }
Plug 'tpope/vim-markdown',       { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby',        { 'for': 'ruby' }
Plug 't9md/vim-ruby-xmpfilter',  { 'for': 'ruby' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'gkz/vim-ls',               { 'for': 'ls' }
Plug 'mtscout6/vim-cjsx',        { 'for': ['coffee', 'ls', 'html'] }
Plug 'digitaltoad/vim-jade',     { 'for': 'jade' }
Plug 'slim-template/vim-slim',   { 'for': 'slim' }
Plug 'vim-scripts/VimClojure',   { 'for': 'clojure' }
Plug 'elixir-lang/vim-elixir',   { 'for': 'elixir' }
Plug 'fatih/vim-go',             { 'for': 'go', 'do': function('InstallGoBinary') }
Plug 'golangtw/gocode.vim',      { 'for': 'go' }

" Local
Plug '~/Projects/nerdtree-ag'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENCODING SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
set ffs=unix,mac,dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHT FIX
" Stop syntax highlight on 1024 column or 256 line
" Color hint on the 101th character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set synmaxcol=256
set ttyfast
if has("gui_running")
  set ttyscroll=3
end
syntax sync minlines=50
let g:ruby_path=$HOME . "/.rbenv/shims/ruby"
call matchadd('WildMenu', '\%101v', &textwidth + 1)

if exists('$TMUX')
  set term=screen-256-color
endif

" Breaking long lines
" gq{motion} % format the line that {motion} moves over
" {Visual}gq % format the visually selected area
" gqq        % format the current line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable highlighting for syntax
syntax on
" allow unsaved background buffers and remember marks/undo for them
set hidden
inoremap # X#
" wrap text if lines longer then the lenght of window
set wrap
set showmatch
set incsearch
set hlsearch
" always show the statusline
set laststatus=2
" insert tabs on the start of a line according to context
set smarttab
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set cmdheight=2
set switchbuf=useopen
set number
set numberwidth=5
set showtabline=2
" set winwidth=100
" disable sound on errors
set noerrorbells
" disable visualbell
set vb t_vb=
set title
" set keyboard timeout
set tm=500
" This makes RVM work inside Vim. I have no idea why.
set shell=zsh
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" Store temporary files in a central spot
set nobackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" display incomplete commands
set showcmd
" For regular expressions turn magic on
set magic
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
set foldmethod=indent
set foldlevelstart=3
set foldnestmax=3
set linebreak
set showbreak=↪
set history=1000
" show the cursor wposition all the time
set ruler
" auto read when file is changd from outside
set autoread
" Always edit file, even when swap file is found
set shortmess+=A
set winheight=5
set winminheight=5
set equalalways
set eadirection=both
set textwidth=100
set timeoutlen=1000 ttimeoutlen=0
" keep more context when scrolling off the end of a buffer
set scrolloff=7
" Solve ruby complete slowness
set complete-=i
set iskeyword+=-
" Split location
set splitright
" Make fugitive diff split vertical
set diffopt+=vertical

if has("gui_running")
  " highlight current line
  set cursorline
  " highlight current column
  set cursorcolumn
  set guicursor+=i:hor5-Cursor
  set guicursor+=a:blinkon0
else
  set nocursorline
  set nocursorcolumn
  set scrolljump=8
  set lazyredraw
  set noshowmatch
  let html_no_rendering=1
end

" Don't override register when pasting
function! RestoreRegister()
    let @" = s:restore_reg
    if &clipboard == "unnamed"
        let @* = s:restore_reg
    endif
    return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONFIG WITH OPINION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<space>" "you may like ',' or '\'
set expandtab
set autoindent
set smartindent
set tabstop=4 softtabstop=4 shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHOW INVISIBLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change CursorShape in iTerm2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI = "\<Esc>[5 q"
let &t_EI = "\<Esc>[2 q"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISABLE AUTOMATIC COMMENT INSERTION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css,scss setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FONT AND COLOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256 " 256 colors

function! SwitchTheme(theme_type)
  if a:theme_type == "focus"
    let g:current_theme = "focus"
    set gfn=Cousine:h17
    set foldcolumn=12
    set linespace=5
    set background=dark
    let g:airline_theme='pencil'
    colorscheme pencil
  elseif a:theme_type == "presentation"
    let g:current_theme = "presentation"
    set gfn=Source\ Code\ Pro\ Semibold:h32
    set foldcolumn=0
    set linespace=3
    set background=light
    set number
    let g:airline_theme='pencil'
    colorscheme pencil
  else
    let g:current_theme = "code"
    set gfn=Source\ Code\ Pro\ Light:h17
    set foldcolumn=0
    set background=dark
    set linespace=3
    if exists("g:current_theme")
      set number
    endif
    let g:airline_theme='jellybeans'
    colorscheme base16-ocean
  end

  if has("gui_running")
      set guioptions-=T
      set guioptions+=e
      set guitablabel=%M\ %t
  endif

  :redraw

endfunction

function! ToggleFocus()
  if g:current_theme == "code"
    :NumbersDisable
    :NumbersToggle
    :GitGutterDisable
    :SignatureToggleSigns
    :call SwitchTheme("focus")
  else
    :NumbersEnable
    :NumbersToggle
    :GitGutterEnable
    :SignatureToggleSigns
    :call SwitchTheme("code")
  end
endfunction

function! ToggleTheme()
  if g:current_theme == "code"
    :call SwitchTheme("presentation")
  else
    :call SwitchTheme("code")
  end
endfunction

command! TT :call ToggleTheme()
command! TF :call ToggleFocus()

:call SwitchTheme("code")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NETRW DEFUAULT SETTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_special_syntax = 1
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_sort_sequence = '[\/]$,*'
" let g:netrw_winsize = -30

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO SOURCE vimrc AFTER SAVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd bufwritepost .vimrc source $MYVIMRC
" autocmd bufwritepost vimrc source $MYVIMRC

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


  autocmd! BufNewFile,BufRead,BufEnter *.ls     set ft=ls
  autocmd! BufNewFile,BufRead *.scss,*.sass     set ft=scss.css
  autocmd! Bufread,BufNewFile *.md              set ft=markdown

  "Setup indent for each language
  autocmd! FileType ruby,eruby,yaml,coffee set ai softtabstop=2 shiftwidth=2 et
  autocmd! FileType python,java,c,javascript,jsx  set ai sw=4 sts=4 et
  autocmd! FileType json  set ai sw=2 sts=2 et
  autocmd! FileType go set ai ts=8 sts=8 noexpandtab

  " Markdown syntax highlight is often wrong
  " you might like to disable it.
  " Markdown 的語法上色常常會錯，移除註解可以停止上色
  " autocmd! FileType mkd,md setlocal syn=off

  autocmd FileType ruby compiler ruby
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
  autocmd FileType html,haml,markdown,handlebars setlocal omnifunc=htmlcomplete#CompleteTags
  " Enable omni completion. (Ctrl-X Ctrl-O)
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType css,sass,scss set omnifunc=csscomplete#CompleteCSS
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType go au BufWritePre <buffer> GoFmt

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <CR>
  autocmd! CmdwinLeave * :call MapNoHighlight()

  " Git commit message format
  autocmd Filetype gitcommit setlocal spell textwidth=72
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM FILE COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Suw w !sudo tee % > /dev/null

command! -nargs=1 F call QuickFileType(<f-args>)
function! QuickFileType(file_type)
    let l:file_type = a:file_type

    if l:file_type == 'j'
        let l:file_type = 'javascript'
    elseif l:file_type == 'r'
        let l:file_type = 'ruby'
    elseif l:file_type == 'e'
        let l:file_type = 'elixir'
    elseif l:file_type == 'h'
        let l:file_type = 'html'
    elseif l:file_type == 'm'
        let l:file_type = 'markdown'
    endif
    exec "setf ".l:file_type
endfunction

function! WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command! W call WriteCreatingDirs()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRAILING WHITE SPACES
" <leader>xd 快速移除行尾空白
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! TrailingWhiteSpaces %s/\s\+$//e
nmap <leader>xd :TrailingWhiteSpaces<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix Ruby Hash Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! FixRubyHash %s/:\(\w*\)\(\s*\)=> /\1:\2/gc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" JUMP TO THE COLUMN OF MARK
nnoremap ' `
nnoremap ` '

" BASH LIKE KEYS FOR THE COMMANDLINE
map! <C-a>     <Home>
map! <C-e>     <End>

" Start non-memorized yank, should follow with a motion.
" For example, use <leader>y2j will yank 2 line to
" paste, but without put them into the yank ring.
map <leader>y "_y

"  Insert a hash rocket with <C-v>
imap <C-v> <space>=><space>
" Insert an arrow with <C-b>
imap <C-b> <space>->

" Apply Macros with Q and disable ex mode
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Clone Paragraph with cp
nnoremap <leader>cp yap<S-}>p

" Clear the search buffer with <leader>sc
map <leader>sc :nohlsearch<CR>

" Can't be bothered to understand ESC vs <C-c> in insert mode
inoremap <C-c> <esc>
inoremap <C-[> <esc>
nnoremap <leader><leader> <C-^>

" Auto-save a file when leav insert mode
inoremap jk <esc>:w<CR>

" format json
command! Json !python -m json.tool

" Start an external command with a single bang
nnoremap ! :!

" More efficient paste on next line
nnoremap <leader>p :pu<CR>
nnoremap <leader>P :pu!<CR>

" Enter command mode with one key stroke
" nnoremap ; :
" nnoremap : ;

" Use + after * to search two words
nnoremap <silent> + :let @/.= '\\|\<'.expand('<cword>').'\>'<cr>n

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT MOTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sa <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#leave_with('undo/redo', 'n', '', '<Esc>')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')

" Move around splits with <C-hjkl>
nnoremap <leader>w <C-w>w
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shorts for tabnew tabn tabp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ca tn tabnew
ca th tabp
ca tl tabn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>
command! BumpToAlternateFile :call OpenTestAlternate()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
command! PromoteToLet :call PromoteToLet()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow multiple indentation/deindentation in visual mode
" > 及 < 可以縮排多次
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interact with GUI clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open with Applications
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! Application :silent !open -a /Applications/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC CtrlP TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>fs :topleft :split<CR>

map <leader>fd :CtrlPClearCache<CR>\|:CtrlP<CR>
map <leader>fa :CtrlPClearCache<CR>\|:CtrlPBufTagAll<CR>
map <leader>ft :CtrlPClearCache<CR>\|:CtrlPTag<CR>
map <leader>ff :CtrlPClearCache<CR>\|:CtrlPCurFile<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addons Settings
" 插件設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" --- CtrlP
" sets local working directory as the nearest ancestor
" that contains one of these directories or files: .git/
let g:ctrlp_map = '<C-p>'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_extensions = []

" exclude directories or files from the search
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|target|dist|DS_Store|tags)|(\.(swp|ico|git|hg|svn|exe|so|dll)|(\~))$'

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" --- YomCompleteMe
" let g:ycm_key_list_select_completion = ['<C-n>']
" let g:ycm_key_list_previous_completion = ['<C-p>']

let g:ycm_global_ycm_extra_conf = '~/.dotfiles/ycm_extra_conf.py'

let g:ycm_complete_in_comments = 0

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'markdown' : 1,
      \ 'pandoc' : 1,
      \ 'hackernews' : 1,
      \}

" --- vim-dispatch
nnoremap <leader>e :Dispatch<CR>

autocmd FileType markdown let b:dispatch = 'octodown %'

" --- JavaScript Syntax
let g:javascript_enable_domhtmlcss = 1 "Enable html,css syntax Highlight in js

" --- emmet-vim
let g:user_emmet_leader_key='<C-Y>'

" --- vim-marked
command! Mo MarkedOpen

" --- vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !has("gui_running")
  let g:airline#extensions#tabline#enabled = 1
endif

let g:airline_theme='jellybeans'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.linenr = '¶ '
let g:airline_detect_modified=1
let g:airline#extensions#tagbar#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1

" --- vim-surround
vmap <leader>" S"lvi"
vmap <leader>' S'lvi'
vmap <leader>` S`lvi`
vmap <leader>( S)lvi(
vmap <leader>{ S}lvi{
vmap <leader>[ S]lvi[
vmap <leader>< S>lvi<

nmap <leader>" ysw"
nmap <leader>' ysw'
nmap <leader>` ysw`
nmap <leader>( ysw(
nmap <leader>{ ysw{
nmap <leader>[ ysw[
nmap <leader>< ysw<

" --- vim-ruby-xmpfilter
let g:xmpfilter_cmd = "seeing_is_believing"

autocmd FileType ruby nmap <buffer> <D-k> <Plug>(seeing_is_believing-mark)
autocmd FileType ruby xmap <buffer> <D-k> <Plug>(seeing_is_believing-mark)
autocmd FileType ruby imap <buffer> <D-k> <Plug>(seeing_is_believing-mark)

autocmd FileType ruby nmap <buffer> <D-u> <Plug>(seeing_is_believing-clean)
autocmd FileType ruby xmap <buffer> <D-u> <Plug>(seeing_is_believing-clean)
autocmd FileType ruby imap <buffer> <D-u> <Plug>(seeing_is_believing-clean)

" xmpfilter compatible
autocmd FileType ruby nmap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby xmap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby imap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)

" --- vim-easy-align
vnoremap <silent><Enter> :EasyAlign<CR>

" --- UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsListSnippets="<C-l>"

" -- Nerdtree
let g:NERDTreeHijackNetrw = 1
" use e. or vs. to open file explorer in certain split
map <leader>q :NERDTreeToggle<CR>

" --- gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" If using 2 factor authorization in github, write ~/.gist-vim with
" token 1234567890yourApplicationTokenGenerated

" --- Syntastic
let g:syntastic_mode_map={ 'mode': 'active',
                         \ 'passive_filetypes': ['hackernews', 'nerdtree', 'tagbar'] }

let g:syntastic_eruby_ruby_quiet_messages = {
                          \ "type":  "syntax",
                          \ "regex": '^possibly useless use of a variable in void context$' }

let g:syntastic_html_tidy_quiet_messages = {
                          \ "type":  "syntax",
                          \ "regex": "^<' + '/' letter not allowed here$" }

let g:syntastic_javascript_eslint_quiet_messages = {
                          \ "type":  "syntax",
                          \ "regex": "^Unexpect token \<" }

let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_pupet_checkers=['puppetlint']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers=['coffeelint']
let g:syntastic_coffee_coffeelint_args = '--file $HOME/.vim/lib/coffeelint.json'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <C-w>e :SyntasticCheck<CR>

" --- Numbers.vim
nnoremap <C-N> :NumbersToggle<CR>

" --- dash.vim
map <leader>d :Dash<CR>

" --- ag.vim
map <leader>a :Ag<CR>

" --- tern_for_vim
autocmd BufEnter * set completeopt-=preview

" --- vim-jsx
let g:jsx_ext_required = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Free leader keys: b c g j k m o r t u v z 1 2 3 4 5 6 7 8 9 0 - = | : > /
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
