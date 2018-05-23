" Vim syntax file
" Language:     text
" Maintainer:   zcodes <zcodes@qq.com>
" Last Change:  2018/5/23 16:48:23
" Remark:       plain text syntax

if exists('b:current_syntax')
  finish
end

syn case match
syn keyword textTodo TODO FIXME NOTE
syn match textTimestamp "\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}"

hi def link textTodo Keyword
hi def link textTimestamp String

let b:current_syntax = 'text'
" vim: ts=8 sts=2 sw=2 et
