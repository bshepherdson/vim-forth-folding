function! FoamFolds()
  if getline(v:lnum) =~? '\v^\s*$'
    return '='
  elseif getline(v:lnum) =~? '\v^\S*:\S*\s'
    return '>1'
  elseif getline(v:lnum) =~? '\v^\s+'
    return '1'
  endif
endfunction

setlocal foldnestmax=1
setlocal foldmethod=expr
setlocal foldexpr=ForthFolds()
" setlocal foldtext=ForthFoldText()
