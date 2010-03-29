" functions
function! SpecDescribed()
  let curline = line(".")
  let curcol  = col(".")
  let line = search("describe", "bW")
  if line > 0
    let line = getline(line)
    let subject = substitute(matchstr(line, "describe [^, ]*"), "^describe ", "", "")
    call cursor(curline, curcol)
    return subject
  else
    return 'subject'
  endif
endfunction

function! SpecSubject()
  return "@" . rails#underscore(SpecDescribed())
endfunction

function! IterVar(collection)
  let collection = substitute(a:collection,"^@","","")
  return rails#singularize(collection)
endfunction
