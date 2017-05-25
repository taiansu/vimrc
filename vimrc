" By Taian Su
" http://blog.taian.su
" You can do what ever you want with this.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive',
Plug 'myusuf3/numbers.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'Konfekt/FastFold'
Plug 'reedes/vim-pencil'
Plug 'AndrewRadev/linediff.vim'
Plug 'chrisbra/unicode.vim'
Plug 'schickling/vim-bufonly'

" Colorscheme
Plug 'brendonrapp/smyck-vim'
Plug 'blerins/flattown'
Plug 'jonathanfilip/vim-lucius'
Plug 'mhinz/vim-janah'

" with Dependency
function! InstallLints(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g eslint-plugin-react eslint
  endif
endfunction

Plug 'neomake/neomake', { 'do': function('InstallLints') }

if has('nvim')
  Plug 'radenling/vim-dispatch-neovim'
endif

" On-demand loading
Plug 'tpope/vim-dispatch',       { 'on': ['Dispatch', 'Focus', 'Start'] }
Plug 'rizzatti/dash.vim',        { 'on': ['Dash', 'DashKeywords'] }
Plug 'itspriddle/vim-marked',    { 'on': 'MarkedOpen', 'for': 'markdown' }
Plug 'rking/ag.vim',             { 'on': 'Ag' }
Plug 'junegunn/vim-easy-align',  { 'on': 'EasyAlign' }
Plug 'mattn/webapi-vim',         { 'on': 'Gist' }
Plug 'mattn/gist-vim',           { 'on': 'Gist' }

" Lazy loading

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --gocode-completer --racer-completer  --tern-completer
  endif
endfunction

Plug 'SirVer/ultisnips'
Plug 'taiansu/vim-snippets'
Plug 'rdnetto/YCM-Generator',    { 'branch': 'stable' }
Plug 'Valloric/YouCompleteMe',   { 'do': function('BuildYCM') }

augroup load_lazy_plugins
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'vim-snippets', 'YouCompleteMe')
                     \| call youcompleteme#Enable() | autocmd! load_lazy_plugins
augroup END

" Language specified
Plug 'sheerun/vim-polyglot'

Plug 'mattn/emmet-vim',                    { 'for': ['html', 'eruby', 'eelixir'] }
Plug 'ternjs/tern_for_vim',                { 'for': 'javascript' }
" Plug 't9md/vim-ruby-xmpfilter',            { 'for': 'ruby' }
Plug 'larrylv/ycm-elixir',                 { 'for': ['elixir', 'eelixir'] }
Plug 'slashmili/alchemist.vim',            { 'for': ['elixir', 'eelixir'] }
" Plug 'avdgaag/vim-phoenix',                { 'for': ['elixir', 'eelixir'] }
Plug 'vim-erlang/vim-erlang-compiler',     { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-skeletons',    { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags',         { 'for': 'erlang' }
Plug 'vim-erlang/vim-rebar',               { 'for': 'erlang' }
Plug 'vim-erlang/vim-dialyzer',            { 'for': 'erlang' }
Plug 'itchyny/vim-haskell-indent',         { 'for': 'haskell' }
" Plug 'LaTeX-Box-Team/LaTeX-Box',           { 'for': 'latex' }

" Local

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
" let base16colorspace=256  " Access colors present in 256 colorspace
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
" set showbreak=↪
set showbreak=⇘
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
set scrolloff=3
" Solve ruby complete slowness
set complete-=i
set iskeyword+=-
" Split location
set splitright
" Make fugitive diff split vertical
set diffopt+=vertical

if has("gui_running")
  " highlight current line
  set nocursorline
  " highlight current column
  set cursorcolumn
  set guicursor+=i:hor5-Cursor
  set guicursor+=a:blinkon0
else
  set nocursorline
  set cursorcolumn
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
    return "p@=RestoreRegister()\<CR>"
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
set tabstop=2 softtabstop=2 shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHOW INVISIBLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>+ :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
  set macmeta
endif

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
" Bracketed paste mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FONT AND COLOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256 " 256 colors

function! SwitchTheme(theme_type)
  if a:theme_type == "focus"
    let g:current_theme = "focus"
    set gfn=Cousine:h15
    set foldcolumn=12
    set linespace=5
    set background=dark
    colorscheme lucius
  elseif a:theme_type == "presentation"
    let g:current_theme = "presentation"
    set gfn=Source\ Code\ Pro\ Semibold:h32
    set foldcolumn=0
    set linespace=3
    set background=light
    set number
    colorscheme lucius
  elseif a:theme_type == "light"
    let g:current_theme = "light"
    set gfn=Source\ Code\ Pro:h17
    set foldcolumn=0
    set background=light
    set linespace=3
    if exists("g:current_theme")
      set number
    endif
    colorscheme lucius
  else
    let g:current_theme = "code"
    set gfn=Source\ Code\ Pro:h15
    set foldcolumn=0
    set background=dark
    set linespace=3
    if exists("g:current_theme")
      set number
    endif
    colorscheme smyck
    let g:airline_theme='flattown'
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

function! ToggleTheme(theme)
  if g:current_theme == "code"
    :call SwitchTheme(a:theme)
  else
    :call SwitchTheme("code")
  end
endfunction

command! TF :call ToggleFocus()
command! TP :call ToggleTheme("presentation")
command! TL :call ToggleTheme("light")

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
let g:netrw_winsize = -30
let g:netrw_retmap = 1
map <leader>q :NERDTreeToggle<CR>

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


  autocmd! BufNewFile,BufRead,BufEnter *.ex,*.exs set ft=elixir
  autocmd! BufNewFile,BufRead,BufEnter *.ls       set ft=ls
  autocmd! BufNewFile,BufRead *.scss,*.sass       set ft=scss.css
  autocmd! BufNewFile,BufRead *.md                set ft=markdown

  " Markdown syntax highlight is often wrong
  " you might like to disable it.
  " Markdown 的語法上色常常會錯，移除註解可以停止上色
  " autocmd! FileType mkd,md setlocal syn=off

  autocmd FileType ruby compiler ruby
  autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
  autocmd FileType html,haml,markdown,handlebars setlocal omnifunc=htmlcomplete#CompleteTags

  " Enable omni completion. (Ctrl-X Ctrl-O)
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType css,sass,scss set omnifunc=csscomplete#CompleteCSS
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1

  if !has('nvim')
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  endif

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
" <leader>xv 快速移除行尾空白
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! TrailingWhiteSpaces %s/\s\+$//e
nmap <leader>xv :TrailingWhiteSpaces<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JUMP TO THE COLUMN OF MARK
nnoremap ' `
nnoremap ` '

" Non-memorized yank and delete, should follow with a motion.
" For example, use <leader>y2j will yank 2 line to
" paste, but without put them into the yank ring.
map <leader>y "_y
map <leader>d "_d

"  Insert a hash rocket
imap <M-m>  <space>=><space>
" Insert an arrow
imap <M-.> <space>-><space>
"  Insert a backward arrow
imap <M-,> <space><-<space>

" Apply Macros with Q and disable ex mode
nnoremap Q @q
vnoremap Q :norm @q<CR>

" Clone Paragraph with cp
nnoremap <leader>cp yap<S-}>p

" Clear the search buffer with <leader>xc
map <leader>xc :nohlsearch<CR>

" Can't be bothered to understand ESC vs <C-c> in insert mode
inoremap <C-c> <esc>
inoremap <C-[> <esc>
nnoremap <leader><leader> <C-^>

" format json
command! Json !python -m json.tool

" Start an external command with a single bang
nnoremap ! :!

" Enter command mode with one key stroke
" nnoremap ; :
" nnoremap : ;

" Use + after * to search two words
nnoremap <silent> + :let @/.= '\\|\<'.expand('<cword>').'\>'<CR>n

" bind K to grep word under cursor
nnoremap K :grep!  "\b<C-R><C-W>\b"<CR>:cw<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFER, TAB AND SPLIT MOTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call submode#enter_with('bufsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('bufsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('bufsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('bufsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('bufsize', 'n', '', '>', '<C-w>>')
call submode#map('bufsize', 'n', '', '<', '<C-w><')
call submode#map('bufsize', 'n', '', '+', '<C-w>+')
call submode#map('bufsize', 'n', '', '-', '<C-w>-')

call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')
" call submode#leave_with('undo/redo', 'n', '', '<Esc>')

" map <leader>fs :topleft :split<CR>

" map <leader>fd :CtrlPClearCache<CR>\|:CtrlP<CR>
map <leader>bb :CtrlPBuffer<CR>
map <leader>bv :CtrlPMixed<CR>
map <leader>bf :CtrlPClearCache<CR>\|:CtrlPCurFile<CR>
map <leader>bc :CtrlPClearCache<CR>
map <leader>bd :bdelete!<CR>
map <leader>bo :BufOnly<CR>
map <M-p> :CtrlP<CR>

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
set clipboard^=unnamed,unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open with Applications
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Application :silent !open -a /Applications/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addons Settings
" 插件設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- ag.vim
if executable('ag')
  " Use AG over grep
  set grepprg=ag\ --noroup\ --nocolor

  " command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  map <leader>/ :Ag<space><cword><CR>
endif

" --- dash.vim
map <leader>\ :Dash<CR>

" --- CtrlP
" sets local working directory as the nearest ancestor
" that contains one of these directories or files: .git/
let g:ctrlp_map               = '<C-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_follow_symlinks   = 1
" let g:ctrlp_by_filename       = 1
let g:ctrlp_extensions        = ['mixed', 'bookmarkdir', 'funky']
" if has('python')
"   let g:ctrlp_match_func      = {'match': 'pymatcher#PyMatch'}
" endif

" Set delay to prevent extra search
" let g:ctrlp_lazy_update = 350

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" exclude directories or files from the search
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.hg|\.svn|\_site|node_modules|bower_components|target|dist|build)$',
    \ 'file': '\v\.(swp|ico|exe|so|dll|DS_Store|tags|class|png|jpg|jpeg|beam)$',
\ }

" --- NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeShowBookmarks=1
let NERDTreeAutoCenter=1
let NERDTreeWinSize=31

" --- YomCompleteMe
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_select_completion = ['<C-n>']
" let g:ycm_key_list_previous_completion = ['<C-p>']

let g:ycm_global_ycm_extra_conf = '~/.dotfiles/ycm_extra_conf.py'

let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'markdown' : 1,
      \ 'pandoc' : 1,
      \}

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

if has('nvim')
    let g:pyton_host_prog = '/usr/local/bin/python'
    let g:pyton3_host_prog = '/usr/local/bin/python3'
    noremap <Esc> <C-\><C-n>
    :set mouse=a
endif

" --- end-wise
" let g:endwise_no_mappings = 1

" --- vim-dispatch
nnoremap <leader>e :Dispatch<CR>

autocmd FileType markdown let b:dispatch = 'octodown %'

" --- JavaScript Syntax
let g:javascript_enable_domhtmlcss = 1 "Enable html,css syntax Highlight in js

" --- emmet-vim
let g:user_emmet_leader_key='<C-y>'

" --- vim-marked
command! Mo MarkedOpen

" --- vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.linenr = '¶ '
let g:airline_detect_modified=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#neomake#enabled=1

" --- vim-ruby-xmpfilter
" let g:xmpfilter_cmd = "seeing_is_believing"

" autocmd FileType ruby nmap <buffer> <D-k> <Plug>(seeing_is_believing-mark)
" autocmd FileType ruby xmap <buffer> <D-k> <Plug>(seeing_is_believing-mark)
" autocmd FileType ruby imap <buffer> <D-k> <Plug>(seeing_is_believing-mark)

" autocmd FileType ruby nmap <buffer> <D-u> <Plug>(seeing_is_believing-clean)
" autocmd FileType ruby xmap <buffer> <D-u> <Plug>(seeing_is_believing-clean)
" autocmd FileType ruby imap <buffer> <D-u> <Plug>(seeing_is_believing-clean)

" " xmpfilter compatible
" autocmd FileType ruby nmap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)
" autocmd FileType ruby xmap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)
" autocmd FileType ruby imap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)

" --- vim-easy-align
vnoremap <silent><Enter> :EasyAlign<CR>

" --- UltiSnips
let g:UltiSnipsExpandTrigger="<M-j>"
let g:UltiSnipsJumpForwardTrigger="<M-j>"
let g:UltiSnipsJumpBackwardTrigger="<M-k>"
let g:UltiSnipsListSnippets="<M-l>"

" --- gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
" If using 2 factor authorization in github, write ~/.gist-vim with
" token 1234567890yourApplicationTokenGenerated

" --- Numbers.vim
nnoremap <C-N> :NumbersToggle<CR>

" --- tern_for_vim
autocmd BufEnter * set completeopt-=preview

" --- vim-jsx
let g:jsx_ext_required = 0

" --- vim-go
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-split)
au FileType go nmap <leader>rv <Plug>(go-run-vertical)

" --- vim-markdown
let g:markdown_fenced_languages = ['html', 'javascript', 'bash=sh', 'ruby']
let g:markdown_syntax_conceal = 0

" --- elm-vim
let g:elm_setup_keybindings = 0

" --- neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

map <leader>l; :lopen<CR>
map <leader>lj :lnext<CR>
map <leader>lk :lprevious<CR>

" --- LaTeX-Box
let s:extfname = expand("%:e")
if s:extfname ==? "tex"
  let g:LatexBox_split_type="new"
endif

" --- tagbar
let g:tagbar_left=0
nmap <leader>t :TagbarToggle<CR>

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

" --- YouCompleteMe
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

" --- vim-gutentags
let g:gutentags_cache_dir = '~/.tags_cache'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Free leader keys: f g j k l m o p r s u v w z 1 2 3 4 5 6 7 8 9 0 [ ] - = _  | : > , . '
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ft=vim :
