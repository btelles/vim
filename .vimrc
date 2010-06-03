filetype on  " Automatically detect file types.
filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete

set nocompatible  " We don't want vi compatibility.
set list!
set modifiable
" Add recently accessed projects menu (project plugin)
set viminfo^=!
 
"Set default window size
set lines=63
set columns=236
winpos 1280 0

"Ruby code completion
set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"Simple Fold
    map <unique> <silent> <Leader>f <Plug>SimpleFold_Foldsearch

"Syntastic
let g:syntastic_enable_signs=1

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

"Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
 
" fuzzy finder maps
map <leader>t :FuzzyFinderTextMate<CR>
"map to fuzzy finder text mate stylez
nnoremap <c-f> :FuzzyFinderTextMate<CR>

"nerd tree toggle
nmap <silent> <Leader>p :NERDTreeToggle<CR>

"sql formatter
  vmap <leader>m        <Plug>SQLU_Formatter<CR>
  nmap <leader>qcl       <Plug>SQLU_CreateColumnList<CR>
  nmap <leader>qcd       <Plug>SQLU_GetColumnDef<CR>
  nmap <leader>qcdt      <Plug>SQLU_GetColumnDataType<CR>
  nmap <leader>qcp       <Plug>SQLU_CreateProcedure<CR>

nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
 
syntax enable


set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
colorscheme vividchalk  " Uncomment this to set a default theme
 
" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
" Show $ at end of line and trailing space as ~
"set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set lcs=tab:\ \ ,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
 
" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes 

nnoremap <silent> <buffer> ". g:NERDTreeMapOpenInTab ." :call <Up>

" Dvorak it!
no d h
no h j
no t k
no n l
"no b f
"no f b
"no s :
"no S :
no j d
no l n
no L N
" Added benefits
no - $
no _ ^
no N <C-w><C-w>
"no T <C-w><C-r>
no H 8<Down>
no T 8<Up>
no D <C-w><C-r>
