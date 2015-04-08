function! ForthFolds()
  if getline(v:lnum) =~? '\v^\s*$'
    return '-1'
  elseif getline(v:lnum) =~? '\v^\S*:\S*\s'
    return '>1'
  elseif getline(v:lnum) =~? '\v^\s*;'
    return '1'
  elseif getline(v:lnum) =~? '\v^\s+'
    return '1'
  else
    return '0'
  endif
endfunction

function! ForthFoldText()
  let thisline = getline(v:foldstart)
  let linecount = ' (' . (v:foldend - v:foldstart + 1) . ' lines)'
  " :noname ( comment )"
  if thisline =~? '\v^:noname\s+(\(\s+[^\)]+\))'
    return substitute(thisline, '\v^:noname\s+(\(\s+[^\)]+\)).*', ':noname \1', '') . linecount
  " :noname
  elseif thisline =~? '\v^:noname\s+'
    return substitute(thisline, '\v^:noname\s+.*', ':noname', '') . linecount
  " : foo ( comment )
  elseif thisline =~? '\v^(\S*:\S*)\s+(\S+)\s+(\(\s+[^\)]+\))'
    return substitute(thisline, '\v(\S*:\S*)\s+(\S+)\s+(\(\s+[^\)]+\))\s+.*', '\1 \2 \3', '') . linecount
  " any:word name-without-comment
  elseif thisline =~? '\v(\S*:\S*)\s+(\S+)(\s+|$)'
    return substitute(thisline, '\v(\S*:\S*)\s+(\S+)\s+.*', '\1 \2', '') . linecount
  else
    return foldtext()
  endif
endfunction


setlocal foldnestmax=1
setlocal foldmethod=expr
setlocal foldexpr=ForthFolds()
setlocal foldtext=ForthFoldText()
