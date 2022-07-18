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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive',
Plug 'tpope/vim-sleuth',
Plug 'liuchengxu/vista.vim'
Plug 'kana/vim-submode'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'reedes/vim-pencil'
Plug 'AndrewRadev/linediff.vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'chrisbra/unicode.vim'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'onsails/lspkind-nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'github/copilot.vim'
Plug 'windwp/nvim-autopairs'
Plug 'rafamadriz/friendly-snippets'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'williamboman/nvim-lsp-installer'

" LspInstall elixirls erlangls fsautocomplete hls html pyright rust_analyzer solargraph tailwindcss tsserver vimls

Plug 'folke/which-key.nvim'
Plug 'guns/xterm-color-table.vim'

" Colorscheme
Plug 'rafi/awesome-vim-colorschemes'

" On-demand loading
Plug 'rizzatti/dash.vim',        { 'on': ['Dash', 'DashKeywords'] }
" Plug 'itspriddle/vim-marked',    { 'on': 'MarkedOpen', 'for': 'markdown' }
Plug 'junegunn/vim-easy-align',  { 'on': 'EasyAlign' }
Plug 'numtostr/BufOnly.nvim',    { 'on': 'BufOnly' }

" Language specified
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim',                    { 'for': ['html', 'eruby', 'eelixir', 'elixir'] }
Plug 'Vimjas/vim-python-pep8-indent',      { 'for': 'python' }
Plug 'vim-erlang/vim-erlang-compiler',     { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-skeletons',    { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags',         { 'for': 'erlang' }
Plug 'vim-erlang/vim-rebar',               { 'for': 'erlang' }
Plug 'vim-erlang/vim-dialyzer',            { 'for': 'erlang' }
Plug 'bitc/vim-hdevtools',                 { 'for': 'haskell' }
Plug 'itchyny/vim-haskell-indent',         { 'for': 'haskell' }
Plug 'pearofducks/ansible-vim'

" Local

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENCODING SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
set termencoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UCS-BOM,UTF-8,big5,gb2312,latin1
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
" set guifont=Hasklug\ Nerd\ Font:h16
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
" set iskeyword+=-
set completeopt=menu,menuone,noselect

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
    autocmd! BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
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
  autocmd FileType html,haml,markdown,html.heex,eruby setlocal omnifunc=htmlcomplete#CompleteTags

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

set sessionoptions+=tabpages,globals " store tabpages and globals in session
if has("gui_running")
    set guioptions-=T
    " set guioptions+=e
    set guioptions-=e " Use showtabline in gui vim
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

" Non-memorized paste, yank and delete, should follow with a motion.
" For example, use <leader>y2j will yank 2 line to
" paste, but without put them into the yank ring.

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d


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
" keep this for function example
" function! RenameFile()
"     let old_name = expand('%')
"     let new_name = input('New file name: ', expand('%'), 'file')
"     if new_name != '' && new_name != old_name
"         exec ':saveas ' . new_name
"         exec ':silent !rm ' . old_name
"         exec ':bd'
"         redraw!
"     endif
" endfunction
" map <leader>n :call RenameFile()<CR>

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
map <leader>ln :lnext<CR>
map <leader>lp :lprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting, DISABLE AUTOMATIC COMMENT INSERTION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup formatting
  autocmd!
  autocmd FileType css,scss setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType javascript setlocal formatprg=prettier\ --parser\ babel
  autocmd FileType markdown setlocal formatprg=prettier\ --parser\ markdown
  autocmd FileType css setlocal formatprg=prettier\ --parser\ css
  autocmd FileType html setlocal formatprg=prettier\ --parser\ html
  autocmd FileType json setlocal formatprg=prettier\ --parser\ json
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle between light and dark background
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ToggleBackgroundColor()
  if (&background == 'light')
    set background=dark
    colorscheme tender
  else
    set background=light
    colorscheme lucius
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addons Settings
" 插件設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" --- dash.vim
map <leader>vd :Dash<CR>

" --- fzf.vim

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

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" --- Telescope
nnoremap <silent><leader>ff <CMD>Telescope find_files<CR>
nnoremap <silent><leader>fg <CMD>Telescope live_grep<CR>
nnoremap <silent><leader>fb <CMD>Telescope buffers<CR>
nnoremap <silent><leader>ft <CMD>Telescope help_tags<CR>
nnoremap <silent><leader>fh <CMD>Telescope harpoon marks<CR>

nnoremap <silent><leader>/ :execute 'Telescope grep_string search='.expand('<cword>')<CR>

if has('mvim')
  nmap <D-p> <CMD>Telescope find_files<CR>
else
  map <M-p> <CMD>Telescope find_files<CR>
endif

lua<<EOF
local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup {}

telescope.load_extension('harpoon')
EOF

" --- gitsigns.nvim
lua << EOF
require('gitsigns').setup {
  current_line_blame = true
}
EOF

" --- JavaScript Syntax
let g:javascript_enable_domhtmlcss = 1 "Enable html,css syntax Highlight in js

" --- emmet-vim
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
let g:user_emmet_leader_key='<C-y>'

" -- lualine.nvim and tabline.nvim
lua << EOF
require('tabline').setup {
    -- Defaults configuration options
    enable = true,
    options = {
    -- If lualine is installed tabline will use separators configured in lualine by default.
    -- These options can be used to override those settings.
      section_separators = {'', ''},
      component_separators = {'', ''},
      max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
      show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
      show_devicons = true, -- this shows devicons in buffer section
      show_bufnr = false, -- this appends [bufnr] to buffer section,
      show_filename_only = false, -- shows base filename only instead of relative path in filename
      --  modified_icon = "+ ", -- change the default modified icon
      modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
    }
  }

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { "", "" },
    section_separators = { "·", "·" },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
       {
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          path = 1,                -- 0: Just the filename
                                   -- 1: Relative path
                                   -- 2: Absolute path

          shorting_target = 0,    -- Shortens path to leave 40 spaces in the window
                                   -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
          }
        }
    },
    lualine_x = {'NearestMethodOrFunction', 'filetype', 'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'quickfix', 'nvim-tree', 'fzf'}
}
EOF

" --- vim-easy-align
vnoremap <silent><Enter> :EasyAlign<CR>

" --- tern_for_vim
autocmd BufEnter * set completeopt-=preview

" --- vim-jsx
let g:jsx_ext_required = 0

" --- vim-markdown
let g:vim_markdown_conceal_code_blocks = 0

" --- vista.vim
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista#renderer#enable_icon=0

nmap <silent><leader>s :Vista!!<CR>

" --- hdevtools
let g:hdevtools_stack = 1

" --- terminal
if has("nvim")
  let test#strategy = "neovim"
else
  let test#strategy = "vimterminal"
endif

" --- which.nvim

lua <<EOF
require("which-key").setup { }

--local wk = require("which-key")
---- As an example, we will create the following mappings:
----  * <leader>ff find files
----  * <leader>fr show recent files
----  * <leader>fb Foobar
---- we'll document:
----  * <leader>fn new file
----  * <leader>fe edit file
---- and hide <leader>1
--
--wk.register({
--  f = {
--    name = "file", -- optional group name
--    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
--    n = { "New File" }, -- just a label. don't create any mapping
--    e = "Edit File", -- same as above
--    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
--    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--  },
--}, { prefix = "<leader>" })
EOF

" Open Application
nmap <leader>o :!open -a iTerm .<CR>

" --- nvim-cmp
lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'
local has_words_before = function()
local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local lspkind = require("lspkind")
cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
  sources = {
    { name = 'nvim_lsp', max_item_count = 20 },
    { name = 'buffer', max_item_count = 25 },
    { name = 'vsnip', max_item_count = 5 },
    { name = 'cmp_tabnine', max_item_count = 5 }
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
      }
    }),
  },
})
EOF

" -- cmp-tabnine
lua <<EOF
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 200;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
})
EOF

" --- nvim-autopairs
lua << EOF
require('nvim-autopairs').setup{
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  },
  enable_check_bracket_line = false,
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
  disable_filetype = { "TelescopePrompt"}
}
EOF

" --- nvim-lspconfig
lua << EOF
local nvim_lsp = require('lspconfig')
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true }
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

  -- tell nvim-cmp about our desired capabilities
  require("cmp_nvim_lsp").update_capabilities(capabilities)
end

local path_to_elixirls = vim.fn.expand("~/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh")
nvim_lsp.elixirls.setup{
    cmd = {path_to_elixirls},
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      dialyzerEnabled = false,
      fetchDeps = false
    },
    -- Unix

    -- Windows
    -- cmd = { "/path/to/elixir-ls/language_server.bat" }
}

nvim_lsp.fsautocomplete.setup{
  cmd = { "dotnet", "fsautocomplete", "--background-service-enabled" },
  init_options = {
    AutomaticWorkspaceInit = true
  },
  root_dir = function(startpath)
    return M.search_ancestors(startpath, matcher)
  end
}


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local lsp_flags = {
  debounce_text_changes = 150,
}
local servers = { 'hls', 'pyright', 'rust_analyzer', 'solargraph', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end

require'lspfuzzy'.setup {
  jump_one = false,
  save_last = true
}
EOF

" --- lspfuzzy
nnoremap <silent><leader>l] <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent><leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>

" nnoremap <silent><leader>ls <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent><leader>lrn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>ll <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <silent><leader>lp <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent><leader>ln <cmd>lua vim.diagnostic.goto_next()<CR>
" nnoremap <silent><leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent><leader>lsd <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" --- harpoon
lua << EOF
require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        excluded_filetypes = { "harpoon" }
    }
})
EOF

nnoremap <silent><leader>jk :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><leader>jl :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-0> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-9> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-8> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-7> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_next()<CR>
nnoremap <C-l> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>j; :lua require("harpoon.term").toTerminal(1)<CR>
nnoremap <silent><leader>j' :lua require("harpoon.term").toTerminal(2)<CR>
nnoremap <silent><leader>j[ :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <silent><leader>j] :lua require("harpoon.term").sendCommand(1, 2)<CR>

" --- nvim-tree.lua
let g:WebDevIconsOS = 'Darwin'

"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

lua << EOF
require'nvim-tree'.setup {
  update_focused_file = {
    enable = true,
    update_cwd  = true,
  },
  view = {
    width = 35
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      show = {
        file = false,
        folder = true,
        folder_arrow = true,
        git = true
      }
    },
    highlight_opened_files = "all"
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    }
  }
}
EOF

nnoremap <silent><leader>q :NvimTreeToggle<CR>
nnoremap <silent><leader>ft :NvimTreeFindFile<CR>
nnoremap <silent><leader>fr :NvimTreeRefresh<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus and NvimTreeResize are also available if you need them

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Free leader keys: a e g i j k n r u w z 1 2 3 4 5 6 7 8 9 0 [ ] - = _  | : > , . '
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ft=vim
