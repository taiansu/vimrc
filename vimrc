" By Taian Su
" http://blog.taian.su
" You can do what ever you want with this.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up Vim Addon Manager
" Vim Addon Manager 插件管理
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif


  " 在底下列出想用的 plugin。
  " 格式為 \ "github:#{user name}/#{plugin name}",
  " 空行之後是各種語言的 syntax
  " Tell VAM which plugins to fetch & load:

  call vam#ActivateAddons([
  \ "github:scrooloose/nerdtree",
  \ "github:Valloric/YouCompleteMe",
  \ "github:SirVer/ultisnips",
  \ "github:taiansu/vim-snippets",
  \ "github:kien/ctrlp.vim",
  \ "github:tpope/vim-fugitive",
  \ "github:tpope/vim-commentary",
  \ "github:tpope/vim-endwise",
  \ "github:tpope/vim-repeat",
  \ "github:tpope/vim-surround",
  \ "github:tpope/vim-rails",
  \ "github:tpope/vim-unimpaired",
  \ "github:rking/ag.vim",
  \ "github:bling/vim-airline",
  \ "github:majutsushi/tagbar",
  \ "github:taiansu/InTermsOf.vim",
  \ "github:t9md/vim-ruby-xmpfilter",
  \ "github:myusuf3/numbers.vim",
  \ "github:itspriddle/vim-marked",
  \ "github:junegunn/vim-easy-align",
  \ "github:kana/vim-submode",
  \ "github:mattn/webapi-vim",
  \ "github:mattn/gist-vim",
  \
  \ "github:tpope/vim-haml",
  \ "github:tpope/vim-markdown",
  \ "github:marijnh/tern_for_vim",
  \ "github:kchmck/vim-coffee-script",
  \ "github:nono/vim-handlebars",
  \ "github:gkz/vim-ls",
  \ "github:digitaltoad/vim-jade",
  \ "github:slim-template/vim-slim",
  \ "github:vim-scripts/VimClojure",
  \ "github:elixir-lang/vim-elixir",
  \ "github:golangtw/go.vim",
  \ "github:golangtw/gocode.vim",
  \ "github:jstemmer/gotags",
  \ "github:othree/yajs.vim",
  \ "github:vim-ruby/vim-ruby",
  \ "matchit.zip",
  \], {'auto_install' : 1})
  " - (<c-x><c-p> complete plugin names):
endfun

call SetupVAM()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENCODING SETTINGS
" 編碼設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
set ffs=unix,mac,dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHT FIX
" 超過 1024 column 或 256 行時停止語法上色，否則 MacVim 會頓
" 第 81 個字元底色提醒
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set synmaxcol=1024
syntax sync minlines=256
noremap <F5> <Esc>:syntax sync fromstart<CR>:set synmaxcol=
" set colorcolumn=80
call matchadd('ColorColumn', '\%81v', 100)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
" 基本設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow unsaved background buffers and remember marks/undo for them
set hidden
" expand tab to space
set expandtab
set autoindent
set smartindent
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
set guicursor+=a:blinkon0
" highlight current line
set cursorline
" highlight current column
set cursorcolumn
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
" keep more context when scrolling off the end of a buffer
set scrolloff=7
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
" fix long line render speed
set foldmethod=syntax
set foldlevelstart=3
set foldnestmax=3
set lazyredraw
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONFIG WITH OPINION
" Leader 鍵, 這裡設成空白鍵
" Tab 長度，這裡設為兩個空白
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<space>" "you may like "," or "\"
set tabstop=2
set shiftwidth=2
set softtabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHOW INVISIBLES
" 顯示換行符及空白
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change CursorShape in iTerm2
" Terminal Vim 的游標形狀
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

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
    set gfn=Cousine:h16
    set foldcolumn=12
    set linespace=5
    set background=light
    if has("gui_running")
      :colorscheme iawriter
    else
      :colorscheme Tomorrow-Night
    endif
    let g:current_theme = "focus"
    :redraw
  elseif a:theme_type == "presentation"
    :colorscheme iawriter
    set gfn=Source\ Code\ Pro\ Medium:h20
    set foldcolumn=0
    set linespace=3
    set background=light
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    set number
    let g:current_theme = "presentation"
  else
    set gfn=Source\ Code\ Pro\ Light:h16
    set foldcolumn=0
    set background=dark
    set linespace=3
    if has("gui_running")
        set guioptions-=T
        set guioptions+=e
        set guitablabel=%M\ %t
        :colorscheme base16-tomorrow
    else
        :colorscheme smyck
    endif
    if exists("g:current_theme")
      set number
    endif
    let g:current_theme = "code"
  end
endfunction

function! ToggleGutters()
endfunction

function! ToggleFocus()
  :call ToggleGutters()
  if g:current_theme == "code"
    :NumbersDisable
    :NumbersToggle
    :call SwitchTheme("focus")
  else
    :NumbersEnable
    :NumbersToggle
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
let g:netrw_winsize = -30

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO SOURCE vimrc AFTER SAVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd bufwritepost .vimrc source $MYVIMRC
" autocmd bufwritepost vimrc source $MYVIMRC

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JUMP TO THE COLUMN OF MARK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ' `
nnoremap ` '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=81
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


  " make CSS omnicompletion work for SASS and SCSS
  autocmd  BufNewFile,BufRead *.json            set ft=javascript
  autocmd  BufNewFile,BufRead *.coffee          set ft=coffee
  autocmd! BufNewFile,BufRead *.scss,*.sass     set ft=scss.css
  autocmd! Bufread,BufNewFile *.md              set ft=markdown
  autocmd! Bufread,BufNewFile *.ex              set ft=elixir
  autocmd  BufNewFile,BufRead *.ruby            set ft=ruby

  "for python and java, autoindent with four spaces, always expand tabs
  autocmd FileType python,java,c set ai sw=4 sts=4 et

  " Markdown syntax highlight is often wrong
  " you might like to disable it.
  " Markdown 的語法上色常常會錯，移除註解可以停止上色
  " autocmd! FileType mkd,md setlocal syn=off

  " Enable omni completion. (Ctrl-X Ctrl-O)
  autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
  autocmd FileType html,haml,markdown,handlebars setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby compiler ruby

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <CR>
  autocmd! CmdwinLeave * :call MapNoHighlight()
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
        let l:file_type = 'eruby'
    elseif l:file_type == 'h'
        let l:file_type = 'html'
    endif
    exec "setf ".l:file_type
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRAILING WHITE SPACES
" <leader>c 快速移除行尾空白
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! TrailingWhiteSpaces()
  nmap <leader>c :%s/\s\+$//e<CR>
endfunction
call TrailingWhiteSpaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix Ruby Hash Syntax
" 把 Ruby 的 Hash rocket ( => ) 語法換成 :
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FixRubyHashSyntax()
  nmap <leader>u :%s/:\(\w*\)\(\s*\)=> /\1:\2/gc<CR>
endfunction
call FixRubyHashSyntax()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASH LIKE KEYS FOR THE COMMANDLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map! <C-a>     <Home>
map! <C-e>     <End>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start non-memorized yank, should follow with a motion.
" For example, use <leader>y2j will yank 2 line to
" paste, but without put them into the yank ring.
map <leader>y "*y

" Insert a hash rocket with <C-t>
imap <C-t> <space>=><space>
" Insert an arrow with <C-f> & <C-d>
imap <C-f> <space>->
imap <C-d> <space><-<space>

" Clear the search buffer with <leader>v
function! MapNoHighlight()
  map <leader>v :nohlsearch<CR>
endfunction
call MapNoHighlight()
" Can't be bothered to understand ESC vs <C-c> in insert mode
imap <C-c> <esc>
nnoremap <leader><leader> <C-^>
" format json
map <leader>j !python -m json.tool<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT MOTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with <C-hjkl>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>o <C-w>w

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
map <leader>m :!mkdir -p

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
:command! PromoteToLet :call PromoteToLet()
:map <leader>l :PromoteToLet<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC CtrlP TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

map <leader>gR :call ShowRoutes()<CR>
map <leader>gv :CtrlPClearCache<CR>\|:CtrlP app/views<CR>
map <leader>gc :CtrlPClearCache<CR>\|:CtrlP app/controllers<CR>
map <leader>gm :CtrlPClearCache<CR>\|:CtrlP app/models<CR>
map <leader>gh :CtrlPClearCache<CR>\|:CtrlP app/helpers<CR>
map <leader>ga :CtrlPClearCache<CR>\|:CtrlP app/assets<CR>
map <leader>gs :CtrlPClearCache<CR>\|:CtrlP spec/<CR>
map <leader>gl :CtrlPClearCache<CR>\|:CtrlP lib<CR>
map <leader>gp :CtrlPClearCache<CR>\|:CtrlP public<CR>
map <leader>gf :CtrlPClearCache<CR>\|:CtrlP features<CR>
map <leader>gr :topleft :split config/routes.rb<CR>
map <leader>gg :topleft 100 :split Gemfile<CR>
map <leader>b :CtrlPClearCache<CR>\|:CtrlPBufTag<CR>
map <leader>f :CtrlPClearCache<CR>\|:CtrlP<CR>
map <leader>F :CtrlPClearCache<CR>\|:CtrlP %%<CR>
map <leader>z z5<CR>
nnoremap <leader>s :buffers<CR>:buffer<Space>

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
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addons Settings
" 插件設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- Numbers.vim
nnoremap <C-n> :NumbersToggle<CR>

" --- CtrlP
" sets local working directory as the nearest ancestor
" that contains one of these directories or files: .git/
let g:ctrlp_map = '<C-p>'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_extensions = ['buffertag']

" exclude directories or files from the search
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.exe$\|\.so$\|\.dll$',
\ 'link': 'some_bad_symbolic_links',
\ }

" --- JavaScript Syntax
let g:javascript_enable_domhtmlcss = 1 "Enable html,css syntax Highlight in js


" --- emmet-vim
let g:user_emmet_leader_key='<c-y>'

" --- vim-marked
nnoremap <leader>p :ToggleMarked!<CR>

" --- vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme='bubblegum'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.linenr = '¶ '
let g:airline_detect_modified=1
let g:airline#extensions#tagbar#enabled=1
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

" --- tagbar
nmap <leader>q :TagbarToggle<CR>

" --- vim-ruby-xmpfilter
let g:xmpfilter_cmd = "seeing_is_believing"

autocmd FileType ruby nmap <buffer> <D-k> <Plug>(seeing_is_believing-mark)
autocmd FileType ruby xmap <buffer> <D-k> <Plug>(seeing_is_believing-mark)
autocmd FileType ruby imap <buffer> <D-k> <Plug>(seeing_is_believing-mark)

autocmd FileType ruby nmap <buffer> <D-r> <Plug>(seeing_is_believing-clean)
autocmd FileType ruby xmap <buffer> <D-r> <Plug>(seeing_is_believing-clean)
autocmd FileType ruby imap <buffer> <D-r> <Plug>(seeing_is_believing-clean)

" xmpfilter compatible
autocmd FileType ruby nmap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby xmap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby imap <buffer> <D-j> <Plug>(seeing_is_believing-run_-x)

" auto insert mark at appropriate spot.
autocmd FileType ruby nmap <buffer> <leader>x <Plug>(seeing_is_believing-run)
autocmd FileType ruby xmap <buffer> <leader>x <Plug>(seeing_is_believing-run)
autocmd FileType ruby imap <buffer> <leader>x <Plug>(seeing_is_believing-run)

" --- vim-easy-align
vnoremap <silent><Enter> :EasyAlign<CR>

" --- YouCompleteMe
" Remember compile YouComPleteMe in plugin directory

" --- UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
" let g:UltiSnipsJumpForwardTrigger="<C-n>"
" let g:UltiSnipsJumpBackwardTrigger="<C-p>"

" --- tern_for_vim
" Remember run npm install in plugin directory
"

" -- Nerdtree
let g:NERDTreeHijackNetrw = 1

" --- gist-vim
let g:gist_clip_command = 'pbcopy'
map <F8> :Gist -P

" --- gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
