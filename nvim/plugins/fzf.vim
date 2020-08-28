

nnoremap <leader>fp :call fzf#run({'options': '--reverse --prompt "ARES PRIVATUS: "', 'down': 20, 'dir': '$ARES_PRIVATUS_DIR', 'sink': 'e' })<CR>
nnoremap <leader>fw :call fzf#run({'options': '--reverse --prompt "ARES WORK: "', 'down': 20, 'dir': '$ARES_WORK_DIR', 'sink': 'e' })<CR>
nnoremap <leader>fc :call fzf#run({'options': '--reverse --prompt "ARES CONFIG: "', 'down': 20, 'dir': '$ARES_CONFIG_DIR', 'sink': 'e' })<CR>
