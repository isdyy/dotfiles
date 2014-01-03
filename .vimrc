" vim:et ts=2 ff=unix:

" Cheatsheet {{{
"   \n              - [custom] Toggle NERDTree
"   \l              - [custom] Toggle taglist
"
"   :sh             - Shell
"   :! {Cmd}        - Execute {Cmd}
"   :r! {Cmd}       - Execute {Cmd} and insert result
"
"   :e {file}       - Open {file}
"   :view {file}    - Open {file} in readonly mode
"
"   :tabnew         - Open new tab
"   :tabe {file}    - Open {file} in new tab
"   :tab sview {file} - Open {file} in new tab (readonly)
"   :tabr           - Switch to the last tab (:tablast)
"   :tabl           - Switch to the first tab (:tabfirst)
"   :tabm {N}       - Move current tab to Nth (N >= 0)
"   :tabs           - Show current tabs
"   :tabo[nly]      - Close all other tabs
"   :tabv {file}    - [custom] Same as :tab sview {file} (read-only mode)
"   <C-[n|p]>       - [custom] Switch to next/prev tab (:g[t|T])
"   \{N}            - [custom] Switch to Nth tab (1 <= N <= 9, 1=first, 9=last)
"
"   <C-w>[s]        - Open a new split window (:sp[lit])
"   <C-w>[v]        - Open a new vertical split window (:vs[plit])
"   <C-w>[j|k|h|l]  - Switch window focus
"
"   za - Open or close the selected fold
"   zA - Open or close the selected fold recursively
"   zo - Open the selected fold
"   zc - Close the selected fold
"   zR - Expand all folds
"   zM - Collapse all folds
"   zj - Next fold
"   zk - Prev fold
"   "*Y - Yunk to clipboard
"
"   /copyright\C    - Case sensitive search (explicit)
"   /Copyright\c    - Case insensitive search
"
" }}}

" Setup Vundle {{{
  " https://github.com/gmarik/vundle
  "
  " Brief help
  " :BundleList          - list configured bundles
  " :BundleInstall(!)    - install(update) bundles
  " :BundleSearch(!) foo - search(or refresh cache first) for foo
  " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
  "
  " see :h vundle for more details or wiki for FAQ

  " Enable filetype before disabling as a workaround for vim on Mac OS X
  " (Prevent vim exiting with non-zero status code)
  " https://github.com/gmarik/vundle/pull/53
  filetype on

  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()

  " Vundle Plugins
  Bundle 'gmarik/vundle'
  Bundle "git://github.com/scrooloose/nerdtree.git"
  Bundle "git://github.com/kana/vim-fakeclip.git"
  Bundle "vim-scripts/taglist.vim"
  Bundle "plasticboy/vim-markdown"

  " Colorschemes
  Bundle "vim-scripts/Color-Sampler-Pack"
  Bundle "vim-scripts/newspaper.vim"
  Bundle "altercation/vim-colors-solarized"

  "filetype plugin indent on

" }}}


" Basics {{{

  filetype plugin on

  set modeline
  set modelines=5
  syntax on
  "syntax off
  set tabstop=4
  "set expandtab
  set noexpandtab
  set hlsearch
  "set nohlsearch
  set nowrap
  "set paste

" }}}

" Clipboard {{{

  " Use OS clipboard
  "set clipboard+=unnamed
  " Copy yunked to clipboard
  "set clipboard=unnamed

  " Paste clipboard content
  imap <C-p>  <ESC>"*pa

  " Yank to/paste from the OS clipboard
  "if has("mac") && !has("gui_running")
  "  vmap <silent> <Leader>y :!pbcopy; pbpaste<CR>
  "  map <silent> <Leader>p :r!pbpaste<CR>
  "else
  "  nmap <Leader>y "*y
  "  nmap <Leader>Y "*yy
  "  nmap <Leader>p "*p
  "  nmap <Leader>P "*P
  "endif


" }}}

" Folding {{{

  "set foldenable
  "set foldcolumn=2
  "set foldmethod=marker
  "set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
  ""set foldtext

" }}}

" Appearance {{{

  "if stridx($TERM, "xterm-256color") >=0
  "  set t_Co=256
  "else
  "  set t_Co=16
  "endif
  set t_Co=256

  set background=light

  if has("gui_running")
    "let g:solarized_termcolors=256
    "colorscheme solarized

    colorscheme lucius
    "colorscheme nuvola
    "colorscheme wombat256
    "colorscheme zenburn
  else
    colorscheme custom
  endif

  set colorcolumn=80,100
  "setl colorcolumn=80,100

  " Visualize SpecialKeys
  set list
  set listchars=tab:^\ ,trail:~,nbsp:%,extends:>,precedes:<,
  ""hi SpecialKey ctermfg=242

  ""hi FullWidthSpace term=underline cterm=underline ctermfg=lightblue guibg=lightblue
  ""match FullWidthSpace /　/
  "hi WhitespaceEOL term=underline ctermbg=yellow guibg=yellow
  "match WhitespaceEOL /\s\+$/
  ""hi TrailingBlankLines term=underline ctermbg=242 guibg=242
  ""match TrailingBlankLines /^\n*\%$/

" }}}

" ctags {{{

  set tags=tags
  let Tlist_Ctags_Cmd = "$HOMEBREW/bin/ctags"
  let Tlist_Show_One_File = 1
  let Tlist_Use_Right_Window = 1
  let Tlist_Exit_OnlyWindow = 1

  " http://yuku-tech.hatenablog.com/entry/20111012/1318416494
  let g:tlist_javascript_settings = 'javascript;c:class;m:method;F:function;p:property'
" }}}

" Hooks {{{

  " Remove trailing whitespaces on saving
  autocmd BufWritePre *.py,*.sh,*.php :%s/\s\+$//e
  " Remove trailing blank lines on saving
  "autocmd BufWritePre *.py,*.sh,*.php :$/^\n*$/d

" }}}

" Key mappings {{{

  " Open NERDTree by \n
  nmap <Leader>n :NERDTreeToggle<CR>

  " Toggle taglist
  nmap <silent> <Leader>l :TlistToggle<CR>

  " Tab
  nnoremap <C-n> gt
  nnoremap <C-p> gT
  "nnoremap <C-m> :tabm<Space>
  nmap <Leader>1 :tabfirst<CR>
  nmap <Leader>2 2gt
  nmap <Leader>3 3gt
  nmap <Leader>4 4gt
  nmap <Leader>5 5gt
  nmap <Leader>6 6gt
  nmap <Leader>7 7gt
  nmap <Leader>8 8gt
  nmap <Leader>9 :tablast<CR>

  " Turn highlights off
  nmap <ESC><ESC> :nohlsearch<CR><ESC>

  " Type commands faster
  noremap ; :

  "imap {} {}<Left>
  "imap [] []<Left>
  "imap () ()<Left>
  "imap "" ""<Left>
  "imap '' ''<Left>
  "imap <> <><Left>

" }}}

" Dash integration {{{
" Searches Dash for the word under your cursor in vim, using the keyword 
" operator, based on file type. E.g. for JavaScript files, I have it 
" configured to search j:term, which immediately brings up the JS doc
" for that keyword. Might need some customisation for your own keywords!
 
function! SearchDash()
  " Some setup
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
 
  " Get the filetype (everything after the first ., for special cases
  " such as index.html.haml or abc.css.scss.erb)
  let s:fileType = substitute(expand("%"),"^[^.]*\.","",1)
 
  " Alternative ways of getting filetype, aborted
  " let s:fileType = expand("%:e")
  " let s:searchType = b:current_syntax.":"
 
  " Match it and set the searchType -- make sure these are the right shortcuts
  " in Dash! Sort by priority in the match list below if necessary, because
  " Tilt-enabled projects may have endings like .scss.erb. 
  if match(s:fileType, "js") != -1
    let s:searchType = "js:"     " can assign this to jQuery, too
  elseif match(s:fileType, "css") != -1
    let s:searchType = "css:"
  elseif match(s:fileType, "html") != -1
    let s:searchType = "html:"
  elseif match(s:fileType, "rb") != -1
    let s:searchType = "rb:"    " can assign this to Rails, too
  elseif match(s:fileType, "php") != -1
    let s:searchType = "php:"
  elseif match(s:fileType, "py") != -1
    let s:searchType = "python:"
  else
    let s:searchType = ""
  endif
 
  " Run it
  let s:url = "dash://".s:searchType.s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>d :call SearchDash()<CR>
" }}}
