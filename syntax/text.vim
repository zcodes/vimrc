" Vim syntax file
" Language:     text
" Maintainer:   zcodes <zcodes@qq.com>
" Last Change:  2017/9/27 11:52:54
" Remark:       plain text syntax
if exists("b:current_syntax")
  finish
end

syn case match
syn keyword textTodo TODO FIXME NOTE
syn match textTimestamp "\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}"

hi def link textTodo Keyword
hi def link textTimestamp String

let b:current_syntax = 'text'
" vim: ts=8 sts=2 sw=2 et
