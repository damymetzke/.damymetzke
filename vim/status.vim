" Display current Git branch within brackets 
function! status#gitbranchstyled() abort
      let branch = gitbranch#name()
      if branch == ''
            return ''
      endif
      return '(git:' . branch . ')'
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'status#gitbranchstyled'
      \ },
      \ }
