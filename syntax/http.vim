if exists('b:current_syntax')
  finish
end

syn case match
syn match httpComment "^#.*$"
syn match httpCommentTitle "^###.*$"
syn match httpMethod "^\(GET\|HEAD\|POST\|PUT\|DELETE\|CONNECT\|OPTIONS\|TRACE\|PATCH\)"
syn match httpHeaderKey "^\S*:"

unlet! b:current_syntax
syn include @httpJs syntax/javascript.vim
syn region httpTest matchgroup=Comment start=/^> {%\s*/ end=/\s*%}\s*$/ contains=@httpJs

unlet! b:current_syntax
syn include @httpJson syntax/json.vim
syn region httpJson matchgroup=Keyword start="^\s*\n\s*{"rs=e end=/}\s*\n/re=s contains=@httpJson

hi def link httpComment Comment
hi def link httpCommentTitle Title
hi def link httpMethod Keyword
hi def link httpHeaderKey Function

let b:current_syntax = 'http'
" vim: ts=8 sts=2 sw=2 et
