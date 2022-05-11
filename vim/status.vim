" Display current Git branch within brackets 
function! status#gitbranchstyled() abort
      let branch = system('git symbolic-ref --short HEAD 2>/dev/null | tr -d "\n"')
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
