function! s:findit(pat,repl)
  let res = s:matchcursor(a:pat)
  if res != ""
    return substitute(res,'\C'.a:pat,a:repl,'')
  else
    return ""
  endif
endfunction

function! s:matchcursor(pat)
  let line = getline(".")
  echo line
  let lastend = 0
  while lastend >= 0
    let beg = match(line,a:pat,lastend)
    echo 'matchstr '.matchstr(line,a:pat,lastend)
    let end = matchend(line,a:pat,lastend)
    echo 'lastend '. lastend
    echo 'beg '. beg
    echo 'end '. end
    echo 'col '. col(".")
    if beg <= col(".") && end >= col(".")
      echo 'last matchstr: '.matchstr(line,'\C'.a:pat,lastend)
      return matchstr(line,'\C'.a:pat,lastend)
    endif
    let lastend = end
  endwhile
  return ""
endfunction

function! g:PyFind()
  if filereadable(expand("<cfile>"))
    return expand("<cfile>")
  endif

  let res = s:findit('\s*from\s*\([\.[:alnum:]]\+\)\s*import\s*\(\w\+\)','\1/\2')
  let res = substitute(res, '\.', '/', '')
  echo res
  if res != ""|return res.(fnamemodify(res,':e') == '' ? '.py' : '')|endif
endfunction

function! s:Find(count,cmd,...)
  let str = ""
  if a:0
    let i = 1
    while i < a:0
      let str .= s:escarg(a:{i}) . " "
      let i += 1
    endwhile
    let file = a:{i}
    let tail = matchstr(file,'[#!].*$\|:\d*\%(:in\>.*\)\=$')
    if tail != ""
      let file = s:sub(file,'[#!].*$|:\d*%(:in>.*)=$','')
    endif
    if file != ""
      let file = s:RailsIncludefind(file)
    endif
  else
    let file = g:PyFind()
    let tail = ""
  endif
  call s:findedit((a:count==1?'' : a:count).a:cmd,file.tail,str)
endfunction

function! s:findedit(cmd,files,...) abort
  let cmd = s:findcmdfor(a:cmd)
  let files = type(a:files) == type([]) ? copy(a:files) : split(a:files,"\n")
  if len(files) == 1
    let file = files[0]
  else
    let file = get(filter(copy(files),'rails#app().has_file(s:sub(v:val,"#.*|:\\d*$",""))'),0,get(files,0,''))
  endif
  if file =~ '[#!]\|:\d*\%(:in\)\=$'
    let djump = matchstr(file,'!.*\|#\zs.*\|:\zs\d*\ze\%(:in\)\=$')
    let file = s:sub(file,'[#!].*|:\d*%(:in)=$','')
  else
    let djump = ''
  endif
  if file == ''
    let testcmd = "edit"
  elseif rails#app().has_path(file.'/')
    let arg = file == "." ? rails#app().path() : rails#app().path(file)
    let testcmd = s:editcmdfor(cmd).' '.(a:0 ? a:1 . ' ' : '').s:escarg(arg)
    exe testcmd
    return ''
  elseif rails#app().path() =~ '://' || cmd =~ 'edit' || cmd =~ 'split'
    if file !~ '^/' && file !~ '^\w:' && file !~ '://'
      let file = s:escarg(rails#app().path(file))
    endif
    let testcmd = s:editcmdfor(cmd).' '.(a:0 ? a:1 . ' ' : '').file
  else
    let testcmd = cmd.' '.(a:0 ? a:1 . ' ' : '').file
  endif
  try
    exe testcmd
    call s:djump(djump)
  catch
    call s:error(s:sub(v:exception,'^.{-}:\zeE',''))
  endtry
  return ''
endfunction

function! s:findcmdfor(cmd)
  let bang = ''
  if a:cmd =~ '\!$'
    let bang = '!'
    let cmd = s:sub(a:cmd,'\!$','')
  else
    let cmd = a:cmd
  endif
  if cmd =~ '^\d'
    let num = matchstr(cmd,'^\d\+')
    let cmd = s:sub(cmd,'^\d+','')
  else
    let num = ''
  endif
  if cmd == '' || cmd == 'E' || cmd == 'F'
    return num.'find'.bang
  elseif cmd == 'S'
    return num.'sfind'.bang
  elseif cmd == 'V'
    return 'vert '.num.'sfind'.bang
  elseif cmd == 'T'
    return num.'tabfind'.bang
  elseif cmd == 'D'
    return num.'read'.bang
  else
    return num.cmd.bang
  endif
endfunction

" Mappings {{{1

function! s:BufMappings()
  nnoremap <buffer> <silent> <Plug>PyFind       :<C-U>call <SID>Find(v:count1,'E')<CR>
  nnoremap <buffer> <silent> <Plug>PySplitFind  :<C-U>call <SID>Find(v:count1,'S')<CR>
  nnoremap <buffer> <silent> <Plug>PyVSplitFind :<C-U>call <SID>Find(v:count1,'V')<CR>
  nnoremap <buffer> <silent> <Plug>PyTabFind    :<C-U>call <SID>Find(v:count1,'T')<CR>
  if !hasmapto("<Plug>PyFind")
    nmap <buffer> gf              <Plug>PyFind
  endif
  if !hasmapto("<Plug>PySplitFind")
    nmap <buffer> <C-W>f          <Plug>PySplitFind
  endif
  if !hasmapto("<Plug>PyTabFind")
    nmap <buffer> <C-W>gf         <Plug>PyTabFind
  endif
endfunction

" }}}1
" from google3.other import something
