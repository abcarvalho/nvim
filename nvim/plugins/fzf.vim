

nnoremap <leader>fp :call fzf#run({'options': '--reverse --prompt "AMDG PRIVATUS: "', 'down': 20, 'dir': '$AMDG_PRIVATUS_DIR', 'sink': 'e' })<CR>
nnoremap <leader>fw :call fzf#run({'options': '--reverse --prompt "AMDG WORK: "', 'down': 20, 'dir': '$AMDG_WORK_DIR', 'sink': 'e' })<CR>

" Include option to search for hidden files in the dotfiles directory:
nnoremap <leader>fc :call fzf#run({'source': 'find .', 'options': '--reverse --prompt "AMDG CONFIG: "', 'down': 20, 'dir': '$AMDG_CONFIG_DIR', 'sink': 'e' })<CR>

