" fzfconfig.vim - fzf config
" Maintainer:   Husain Alshehhi <https://github.com/husainaloos/fzfconfig/>
" Version:      0.1

if exists("g:fzfconfig") || &cp || v:version < 700
  finish
endif

let g:fzfconfig = 1

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <C-t> :FZF<cr>
nnoremap <silent> <leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
