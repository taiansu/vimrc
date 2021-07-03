" By Taian Su
" http://blog.taian.su
" You can do what ever you want with this.
"
" set hls ic is nu noswf
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive',
Plug 'tpope/vim-sleuth',
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'reedes/vim-pencil'
Plug 'AndrewRadev/linediff.vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'chrisbra/unicode.vim'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CocInstall coc-lists coc-snippets coc-yank coc-highlight coc-git coc-tsserver coc-prettier coc-rls coc-solargraph coc-json coc-css coc-tslint coc-elixir coc-tabnine coc-tailwindcss

" Colorscheme
Plug 'guns/xterm-color-table.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'jacoborus/tender.vim'
Plug 'dim13/smyck.vim'
Plug 'arcticicestudio/nord-vim'

Plug 'sbdchd/neoformat'
Plug 'liuchengxu/vim-which-key'

" On-demand loading
Plug 'rizzatti/dash.vim',        { 'on': ['Dash', 'DashKeywords'] }
Plug 'itspriddle/vim-marked',    { 'on': 'MarkedOpen', 'for': 'markdown' }
Plug 'junegunn/vim-easy-align',  { 'on': 'EasyAlign' }
Plug 'numtostr/BufOnly.nvim',    { 'on': 'BufOnly' }

" Language specified
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim',                    { 'for': ['html', 'eruby', 'eelixir'] }
Plug 'Vimjas/vim-python-pep8-indent',      { 'for': 'python' }
Plug 'vim-erlang/vim-erlang-compiler',     { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-skeletons',    { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags',         { 'for': 'erlang' }
Plug 'vim-erlang/vim-rebar',               { 'for': 'erlang' }
Plug 'vim-erlang/vim-dialyzer',            { 'for': 'erlang' }
" Plug 'bitc/vim-hdevtools',                 { 'for': 'haskell' }
" Plug 'itchyny/vim-haskell-indent',         { 'for': 'haskell' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'pearofducks/ansible-vim'

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
lang zh_TW.UTF-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHT FIX
" Stop syntax highlight on 1024 column or 256 line
" Color hint on the 101th character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(has("termguicolors"))
  set termguicolors
endif

set synmaxcol=256
set t_Co=256 " 256 colors

set ttyfast
if has("gui_running")
  set ttyscroll=3
endif
set guifont=Hasklig:h16
syntax sync minlines=50
let g:ruby_path=$HOME . "/.asdf/shims/ruby"
call matchadd('WildMenu', '\%101v', &textwidth + 1)

if exists('$TMUX')
  set term=screen-256-color
endif

colorscheme tender

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

" wrap text if lines longer then the lenght of window
set wrap
set showmatch
set hlsearch
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
set tm=300
" This makes RVM work inside Vim. I have no idea why.
set shell=zsh
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" Store temporary files in a central spot
set nobackup
set backupdir=~/.vim/tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,/var/tmp,/tmp
set undodir=~/.vim/undo
set whichwrap+=<,>,h,l
" display incomplete commands
set showcmd
" For regular expressions turn magic on
set magic
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
set foldmethod=manual
set foldlevelstart=99
set linebreak
" set showbreak=↪
set showbreak=⇘
" Always edit file, even when swap file is found
set shortmess+=Ac
set winheight=5
set winminheight=5
set equalalways
set eadirection=both
set textwidth=100
set timeoutlen=1000 ttimeoutlen=0
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Solve ruby complete slowness
" set complete-=i
set iskeyword+=-
" Split location
set splitright
set splitbelow
" Make fugitive diff split vertical
set diffopt+=vertical

" allows to move the cursor past the last character in insert mode.
set virtualedit=insert

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'

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
vnoremap <silent> <expr> p <SID>Repl()

cabbr <expr> %% expand('%:p:h')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
  set macmeta
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoVim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")

  set mouse=a mousemodel=popup_setpos
  " Terminal mode:
  tnoremap <M-[> <C-\><C-n>
  " tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>

  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l

  command! -nargs=* St split | terminal <args>
  command! -nargs=* Vt vsplit | terminal <args>

  nnoremap <M-v> :vsplit term://zsh<CR>
  nnoremap <M-s> :split term://zsh<CR>
endif

" Insert mode:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
" Visual mode:
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
" Normal mode:
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

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
" NETRW DEFUAULT SETTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_special_syntax = 1
" let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_winsize = -30
let g:netrw_altv = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO SOURCE vimrc AFTER SAVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePost $MYVIMRC source $MYVIMRC


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tsx filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup SyntaxSettings
    autocmd! BufNewFile,BufRead,BufEnter *.ex,*.exs set ft=elixir
    autocmd! BufNewFile,BufRead,BufEnter *.ls       set ft=ls
    autocmd! BufNewFile,BufRead *.scss,*.sass       set ft=scss.css
    autocmd! BufNewFile,BufRead *.md                set ft=markdown
    autocmd! BufNewFile,BufRead *.tsx               set ft=typescript.typescriptreact
augroup END

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

  autocmd BufEnter,BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <CR>
  autocmd! CmdwinLeave * :call MapNoHighlight()

  " Git commit message format
  autocmd Filetype gitcommit setlocal spell textwidth=72

augroup End
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interact with GUI clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard^=unnamed,unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open with Applications
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! App :silent !open -a /Applications/

if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONFIG WITH OPINION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smartindent
set tabstop=2 softtabstop=2 shiftwidth=2
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

let mapleader="\<space>" "you may like ',' or '\'
let maplocalleader="\\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHOW INVISIBLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>+ :set list!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SILENT SHELL COMMAND
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>! :sil !

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM FILE COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Suw w !sudo tee % > /dev/null

function! WriteCreatingDirs()
    call mkdir(expand('%:h'), 'p')
    write
endfunction
command! W call WriteCreatingDirs()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRAILING WHITE SPACES
" <leader>xv 快速移除行尾空白
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight trailing whitespace
match ErrorMsg '\s\+$'

command! TrailingWhiteSpaces %s/\s\+$//e
nmap <leader>xv :TrailingWhiteSpaces<CR>:nohlsearch<CR>

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

"  Insert a backward arrow
imap <M-,> <space><-<space>
" Insert an arrow
imap <M-.> <space>-><space>
"  Insert a hash rocket
imap <M-/> <space>=><space>

" Apply Macros with Q and disable ex mode
nnoremap Q @q
vnoremap Q :norm @q<CR>

" Clone Paragraph with cp
nnoremap <leader>cp yap<S-}>p

" Clear the search buffer with <leader>xc
map <leader>xc :nohlsearch<CR>

" Show next matched string at the center of screen
nnoremap n nzz
nnoremap N Nzz

" Can't be bothered to understand ESC vs <C-c> in insert mode
inoremap <C-c> <ESC>
inoremap <C-[> <ESC>
nnoremap <leader><leader> <C-^>

" Enter command mode with one key stroke
" nnoremap ; :
" nnoremap : ;

" Use + after * to search two words
nnoremap <silent> + :let @/.= '\\|\<'.expand('<cword>').'\>'<CR>n

" map fold trigger to zz
nnoremap zz za


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check the current syntax highlight under the cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

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

map <leader>bd :bdelete!<CR>
map <leader>bo :BufOnly<CR>
" nnoremap <C-b> <C-^>
" inoremap <C-b> <esc><C-^>
map ]b :bn<CR>
map [b :bp<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shorts for tabnew tabn tabp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ca tn tabnew
ca th tabp
ca tl tabn
ca tc BufOnly
ca to BufOnly

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        exec ':bd'
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow multiple indentation/deindentation in visual mode
" > 及 < 可以縮排多次
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open quickfix box
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>lo :lopen<CR>
map <leader>lj :lnext<CR>
map <leader>lk :lprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addons Settings
" 插件設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- coc
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
highlight CocFloating ctermfg=235 ctermbg=81 guifg=#282828 guibg=#36393C

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for format selected region
xmap <leader>vc  <Plug>(coc-format-selected)
nmap <leader>vc  <Plug>(coc-format-selected)

nmap <leader>vs :call CocAction('codeLensAction')<CR>

" --- blamer.nvim
let g:blamer_enabled = 1
" let g:blamer_show_in_visual_modes = 0
" let g:blamer_show_in_insert_modes = 0

" --- dash.vim
map <leader>vd :Dash<CR>

" --- fzf.vim

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

if has('mvim')
  nmap <D-p> :FZF<CR>
else
  map <M-p> :FZF<CR>
endif

function! RipgrepBottom()
  call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.expand('<cword>'), 1,
      \ fzf#vim#with_preview('up:50%'), 0)
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>/ :call RipgrepBottom<CR>
nnoremap <leader>vg :GFiles --cached --others --exclude-standard<CR>
nnoremap <leader>vf :Files --cached --others --exclude-standard<CR>
nnoremap <leader>vb :Buffers<CR>
nnoremap <leader>vm :Marks<CR>
nnoremap <leader>\ :Rg<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" --- NERDTree
autocmd FileType nerdtree :vert resize 30
let g:NERDTreeQuitOnOpen=1

let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeShowBookmarks=1
let NERDTreeAutoCenter=1
let NERDTreeWinSize=31

function! s:in_side_buffer() abort
  let s:current_buffer_name = expand('%:t')
  return s:current_buffer_name == '' || &ft == 'nerdtree'
endfunction

nnoremap <leader>/ :call RipgrepBottom()<CR>

function! ToggleOrFind() abort
  if <SID>in_side_buffer()
    :NERDTreeToggle
  else
    :NERDTreeFocus
  endif
endfunction

map <leader>q :call ToggleOrFind()<CR>

command ResizeWin vert res 30<CR>
nnoremap <leader>vr :NERDTreeFocus<CR>:ResizeWin<CR><C-w>l

" --- JavaScript Syntax
let g:javascript_enable_domhtmlcss = 1 "Enable html,css syntax Highlight in js

" --- emmet-vim
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
let g:user_emmet_leader_key='<C-y>'

" --- vim-airline

let g:airline_theme='jellybeans'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch = 1

" --- vim-easy-align
vnoremap <silent><Enter> :EasyAlign<CR>

" --- tern_for_vim
autocmd BufEnter * set completeopt-=preview

" --- vim-jsx
let g:jsx_ext_required = 0

" --- vim-markdown
let g:vim_markdown_conceal_code_blocks = 0

" --- Neoformat
nnoremap <leader>vd :Neoformat<CR>
let g:neoformat_enabled_javascript = ['prettier']

" --- tagbar
let g:tagbar_left=1
let g:tagbar_width=35
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

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'i:instance:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type',
        \ 'i' : 'instance'
    \ },
    \ 'scope2kind' : {
        \ 'module'   : 'm',
        \ 'class'    : 'c',
        \ 'data'     : 'd',
        \ 'type'     : 't',
        \ 'instance' : 'i'
    \ }
\ }

let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

let g:tagbar_type_rust = {
  \ 'ctagsbin' : 'ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'kinds': [
        \ 'h:headings',
    \ ],
    \ 'sort': 0
\ }

nmap <silent><leader>t :TagbarToggle<CR>

" --- vim-gutentags
" let g:gutentags_trace = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_add_default_project_roots = 0

let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_project_root = ['package.json', '.git']

let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" --- hdevtools
let g:hdevtools_stack = 1

" --- terminal
if has("nvim")
  let test#strategy = "neovim"
else
  let test#strategy = "vimterminal"
endif

" --- vim-which-key
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" Define prefix dictionary
let g:which_key_map =  {}

autocmd FileType which_key highlight WhichKey cterm=bold ctermbg=DarkGray gui=bold ctermfg=7 guifg=LightSkyBlue3
autocmd FileType which_key highlight WhichKeySeperator ctermbg=DarkGray ctermfg=7 guifg=Silver
autocmd FileType which_key highlight WhichKeyGroup cterm=bold ctermbg=DarkGray ctermfg=7
autocmd FileType which_key highlight WhichKeyDesc ctermbg=DarkGray ctermfg=7
autocmd FileType which_key highlight WhichKeyFloating ctermbg=DarkGray ctermfg=7 guibg=Gray25

" Open Application
nmap <leader>o :!open -a iTerm .<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Free leader keys: a e f g i j k l m r s t u w z 1 2 3 4 5 6 7 8 9 0 [ ] - = _  | : > , . '
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ft=vim :
