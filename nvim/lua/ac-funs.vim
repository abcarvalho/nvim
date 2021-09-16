" switch NVim and iTerm2 Themes
function! Theme_Swapper()
    if &background ==? 'dark'
        set background=light
        colorscheme shine "solarized8
    else
        set background=dark
        colorscheme moonlight
    endif
    silent !osascript -e 'tell app "System Events" to keystroke "s" using {shift down, option down, control down}'
endfunction 

command! SwapThemes call Theme_Swapper()

" Define Shortcut:
" nnoremap <leader>st :SwapThemes<CR>
