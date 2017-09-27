" Vim syntax file
" Language:     text
" Maintainer:   zcodes <zcodes@qq.com>
" Last Change:  2017/9/27 11:27:26
" Remark:       plain text syntax
if exists("b:current_syntax")
  finish
end

syn case match
syn keyword textTodo TODO FIXME NOTE

hi def link textTodo Keyword

let b:current_syntax = 'text'
" vim: ts=8 sts=2 sw=2 et
