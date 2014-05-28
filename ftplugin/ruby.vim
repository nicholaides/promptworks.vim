" turn Ruby 1.8 style hash pair into 1.9 style
" e.g. turn
"  :key => value
"  into
"  key: value
nnoremap <leader>rh F:xelce:<Esc>

" Ruby turn string into symbol
nnoremap <leader>rS ds"i:<Esc>

" Ruby turn symbol into string
nnoremap <leader>rs ysaw"hx

" Add ',:focus' to the current line in of describe/context rspec block
nnoremap <leader>rf $vbc,:focus do<Esc>
" Remove ', :focus => true' from the end of the describe/context rspec block
"  Really, it will remove anything between the last ',' and 'do'
nnoremap <leader>rF $bhvF,c<space><Esc>ciw<space><Esc>

" rspec: convert a ivar assignment to a let
nnoremap <leader>rl ^cwlet(:<Esc>elc2w){ <Esc>A }<Esc><<

iabbrev rdebug require 'ruby-debug'; debugger; 1

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
