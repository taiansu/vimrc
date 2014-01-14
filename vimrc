" Base on Gary Bernhardt's .vimrc file
" Use CtrlP instead of CommandT

set nocompatible | filetype off | syn on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up Vundle - the vim plugin bundler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Essential Plugins
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'

Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'

" Completer plugins
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'junegunn/vim-easy-align'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/emmet-vim'

" Utility plugins
Bundle 'vim-scripts/matchit.zip'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rbenv'
Bundle 'taiansu/InTermsOf.vim'
Bundle 't9md/vim-ruby-xmpfilter'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'itspriddle/vim-marked'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'scrooloose/nerdtree'

" Syntax plugins
Bundle 'marijnh/tern_for_vim'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'gkz/vim-ls'
Bundle 'digitaltoad/vim-jade'
Bundle 'slim-template/vim-slim'
Bundle 'vim-scripts/VimClojure'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-markdown'
Bundle 'golangtw/go.vim'
Bundle 'golangtw/gocode.vim'
Bundle 'jstemmer/gotags'
Bundle 'vim-ruby/vim-ruby'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENCODING SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
set ffs=unix,mac,dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FONT AND COLOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set gfn=Source\ Code\ Pro\ Light:h16

:set t_Co=256 " 256 colors
:set background=dark
:colorscheme Tomorrow-Night

highlight Pmenu ctermbg=94 guibg=#875F00
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHT FIX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set synmaxcol=1024
syntax sync minlines=256
noremap <F8> <Esc>:syntax sync fromstart<CR>:set synmaxcol=
let &colorcolumn=join(range(81,1024),",")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=1000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set number
set numberwidth=5
set showtabline=2
set winwidth=79
" disable sound on errors
set noerrorbells
" disable visualbell
set vb t_vb=
set title
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
let javaScript_fold=1
set lazyredraw
set linebreak
set showbreak=↪
let mapleader=","
" Always edit file, even when swap file is found
set shortmess+=A

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change CursorShape in iTerm2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISABLE AUTOMATIC COMMENT INSERTION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css,scss setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SET .ruby AS RUBY FILE FOR RAILS 4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.ruby set filetype=ruby

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NETRW DEFUAULT SETTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 4
let g:netrw_special_syntax = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHOW INVISIBLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

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
  autocmd BufNewFile,BufRead *.json             set ft=javascript
  autocmd BufNewFile,BufRead *.coffee           set ft=coffee
  autocmd! BufNewFile,BufRead *.scss,*.sass     set ft=scss.css
  autocmd! Bufread,BufNewFile *.md               set ft=markdown

  "for python and java, autoindent with four spaces, always expand tabs
  autocmd FileType python,java,c set ai sw=4 sts=4 et

  " Don't syntax highlight markdown because it's often wrong
  " autocmd! FileType mkd,md setlocal syn=off

  " Enable omni completion. (Ctrl-X Ctrl-O)
  autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
  autocmd FileType html,haml,markdown,handlebars setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS "use tern
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType ruby compiler ruby
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

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
    elseif l:file_type == 'ha'
        let l:file_type = 'handlebars'
    elseif l:file_type == 's'
        let l:file_type = 'css'
    endif
    exec "setf ".l:file_type
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRAILING WHITE SPACES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! TrailingWhiteSpaces()
  nmap <leader>c :%s/\s\+$//e<CR>
endfunction
call TrailingWhiteSpaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix Ruby Hash Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FixRubyHashSyntax()
  nmap <leader>u :%s/:\(\w*\)\(\s*\)=> /\1:\2/gc<CR>
endfunction
call FixRubyHashSyntax()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASH LIKE KEYS FOR THE COMMANDLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map! <C-A>     <Home>
map! <C-E>     <End>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RESIZE SPLIT WINDOW
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-Up> :res +2<CR>
map <C-Down> :res -2<CR>
" map <Right> :vertical res +2<CR>
" map <Left> :vertical res -2<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <C-hjkl>
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-h> <C-w>h<C-w>30>
nnoremap <C-l> <C-w>l<C-w>30>
set winheight=5
set winminheight=5
set equalalways
set eadirection=both
" Insert a hash rocket with <C-f>
imap <C-f> <space>=><space>

" Clear the search buffer when hitting return
function! MapNoHighlight()
  map <leader>/ :nohlsearch<CR>
endfunction
call MapNoHighlight()
" Can't be bothered to understand ESC vs <C-c> in insert mode
imap <C-c> <esc>
nnoremap <leader><leader> <C-^>
" format json
map <leader>j !python -m json.tool<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" inoremap <tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <s-tab> <C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<CR>
"map <leader>e :edit %%
"map <leader>v :view %%

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
:command! PromoteToLet :call PromoteToLet()
:map <leader>l :PromoteToLet<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
vnoremap <leader>rv :call ExtractVariable()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap <leader>ri :call InlineVariable()<CR>

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
map <leader>gt :CtrlPClearCache<CR>\|CtrlPTag<CR>
map <leader>f :CtrlPClearCache<CR>\|:CtrlP<CR>
map <leader>F :CtrlPClearCache<CR>\|:CtrlP %%<CR>
map <leader>z z5<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" nnoremap <leader>. :call OpenTestAlternate()<CR>

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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interact with GUI clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addons Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- Numbers.vim
nnoremap <C-n> :NumbersToggle<CR>

" --- CtrlP
" sets local working directory as the nearest ancestor
" that contains one of these directories or files: .git/
let g:ctrlp_map = '<C-p>'
let g:ctrlp_working_path_mode = 'ra'

" exclude directories or files from the search
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.exe$\|\.so$\|\.dll$',
\ 'link': 'some_bad_symbolic_links',
\ }

" --- JavaScript Syntax
let g:javascript_enable_domhtmlcss = 1 "Enable html,css syntax Highlight in js

" Search Dash for word under cursor
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd = "silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>d :call SearchDash()<CR>

" ---UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" --- YouCompleteMe
let g:ycm_allow_changing_updatetime = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']

" --- emmet-vim
let g:user_emmet_leader_key='<c-y>'

" --- vim-marked
nnoremap <leader>mm :MarkedOpen!<CR>
nnoremap <leader>mc :MarkedQuit<CR>

" --- vim-airline
let g:airline_theme='bubblegum'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = '¶ '
let g:airline_enable_branch=1
let g:airline_branch_prefix = '⎇ '
let g:airline_modified_detection=1
let g:airline_enable_syntastic=1

" --- vim-surround
vmap <leader>" S"lvi"
vmap <leader>' S'lvi'
vmap <leader>` S`lvi`
vmap <leader>( S)lvi(
vmap <leader>{ S}lvi{
vmap <leader>[ S]lvi[
vmap <leader>< S>lvi<

" --- tagbar
nmap <leader>t :TagbarToggle<CR>

" --- NERDTreeToggle
nmap <leader>q :NERDTreeToggle<CR>

" --- vim-ruby-xmpfilter
autocmd FileType ruby nmap <buffer> <leader>v <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <leader>v <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <leader>v <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <leader>b <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <leader>b <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <leader>b <Plug>(xmpfilter-run)

" --- vim-easy-align
vnoremap <silent><Enter> :EasyAlign<CR>
