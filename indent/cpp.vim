if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

setlocal indentexpr=GetCppIndent()
let b:undo_indent = 'setl cin<'

function! GetCppIndent()
  let l:line = getline(v:lnum)
  let l:prev = getline(prevnonblank(v:lnum - 1))
  echomsg l:line

  let l:indent = cindent(v:lnum)

  " align the <<
  if match(l:line, '^\s*\(<<\|>>\)') != -1 && match(l:prev, '^\s*\(std::\)\=\(cout\|cin\) \(<<\|>>\)') != -1
    let l:indent = match(l:prev, '\(<<\|>>\)')
    echomsg l:indent
    return l:indent
  endif

  return l:indent
endfunction
