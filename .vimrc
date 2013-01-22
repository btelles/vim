call pathogen#infect()


filetype on  " Automatically detect file types.
filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete

set foldmethod=indent
set hlsearch

set nocompatible  " We don't want vi compatibility.
set list!
set modifiable

syntax enable
set tags=~/.vimtags

" Show list of files
set wildmode=longest,list,full
set wildmenu

" use external ruby "
let g:ruby_debugger_builtin_sender = 0
let g:ruby_debugger_no_maps = 1

"delimitMate options
let delimitMate_quotes = "\" ' ` *"
let delimitMate_expand_cr = 0
let delimitMate_expand_space = 1

let g:acp_behaviorSnipmateLength = 1
let g:acp_behaviorRubyOmniMethodLength = 2
let g:acp_behaviorRubyOmniSymbolLength = 2

function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction


" Add recently accessed projects menu (project plugin)
set viminfo^=!
 
"Set default window size
"set lines=63
set columns=1036
winpos 1280 0

"disable the toolbar
set guioptions-=T

"Ruby code completion
set ofu=syntaxcomplete#Complete
"let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"Syntastic
let g:syntastic_enable_signs=1

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

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
 
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk
" colorscheme twilight257
set guifont=DejaVu\ Sans\ Mono\ Bold\ 11
 
" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp ""incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

set statusline=%#warningmsg#%{SyntasticStatuslineFlag()}%*\ %t\ %l,%v


 
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

" Copy and Paste to clipboard
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>
nmap <C-A-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-A-v> <Esc><C-A-v>a


" Move lines up and Down
nmap <C-Up> jjtP
nmap <C-Down> jjp
" Move multiple lines
vmap <C-Up> xtP`[V`]
vmap <C-Down> xp`[V`]

nmap <leader>bb <Plug>BlockToggle

" strip white spaces
  nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" describe activerecord tables
  noremap <A-d> :DBDescribeTable<CR>

" show alternate file
  noremap <leader>a :A<CR>
  noremap <leader>rc :Rcontroller 
  noremap <leader>rm :Rmodel 
  noremap <leader>rs :Rspec 
  noremap <leader>rv :Rview 
  noremap <leader>rh :Rhelper 
  noremap <leader>rf :Rfabricator 
  noremap <leader>rj :Rjavascript 

" Gundo toggle
nnoremap <F6> :GundoToggle<CR>

" describe activerecord tables
  "noremap <Ctrl-a>= :Align =<CR>
  "noremap <Ctrl-a>| :Align |<CR>

" Simple Fold
"map <unique> <silent> <Leader>f <Plug>SimpleFold_Fold

" Fast saving
  nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
  map <leader>e :e! ~/.vimrc<cr>

" Git maps "
  map <leader>gs :Gstatus<cr>
  map <leader>ge :Ge:<cr>
  map <leader>gc :Gcommit -m "
  map <leader>gw :Gwrite<cr>

  no -- :TComment<CR>

" alt+n or alt+p to navigate between entries in QuickFix
  map <silent> <m-p> :cp <cr>
  map <silent> <m-n> :cn <cr>

"map to fuzzy finder text mate stylez
  nnoremap <c-f> :CommandT<CR>
  let g:CommandTMatchWindowAtTop= 1

"nerd tree toggle
  nmap <silent> <Leader>p :NERDTreeToggle<CR>
  let NERDTreeMouseMode = 3

" unhighlight text
  nmap <silent> ,/ :nohlsearch<CR>

"sql formatter
  vmap <leader>m        <Plug>SQLU_Formatter<CR>
  nmap <leader>qcl       <Plug>SQLU_CreateColumnList<CR>
  nmap <leader>qcd       <Plug>SQLU_GetColumnDef<CR>
  nmap <leader>qcdt      <Plug>SQLU_GetColumnDataType<CR>
  nmap <leader>qcp       <Plug>SQLU_CreateProcedure<CR>

" Reload Snippets
  nmap ,rr :call ReloadAllSnippets()<CR>

  nmap <leader>c NERDComToggleComment
" Add debugger stortcut "
  nmap <leader>rdb      :Rdebugger './script/rails server'<CR>
  nmap <leader>rds      :RdbStop<CR>
"-" Dvorak it!
no K 8<Up>
"no J 8<Down>
no N <C-w><C-w>


map Y y$
nnoremap <silent> <C-L> :nohls<CR><C-L>

inoremap ø <C-O>o
inoremap <M-o> <C-O>o
" Emacs style mappings
inoremap <C-A> <C-O>^
inoremap <C-X><C-@> <C-A>
cnoremap <C-A> <Home>
cnoremap <C-X><C-A> <C-A>
" If at end of a line of spaces, delete back to the previous line.
" Otherwise, <Left>
inoremap <silent> <C-B> <C-R>=getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"<CR>
cnoremap <C-B> <Left>
" If at end of line, decrease indent, else <Del>
inoremap <silent> <C-D> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"<CR>
cnoremap <C-D> <Del>
" If at end of line, fix indent, else <Right>
inoremap <silent> <C-F> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"<CR>
inoremap <C-E> <End>
cnoremap <C-F> <Right>

noremap <F1> <Esc>
noremap! <F1> <Esc>

nmap \\ <Plug>NERDCommenterInvert
xmap \\ <Plug>NERDCommenterInvert

" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

" Add auto tabularize to cucumber stories "
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
