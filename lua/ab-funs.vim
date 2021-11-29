" switch NVim and iTerm2 Themes
function! ThemeSwapper()
    if &background ==? 'dark'
        set background=light
        colorscheme shine
    else
        set background=dark
        colorscheme material
    endif

    silent !osascript -e 'tell app "System Events" to keystroke "s" using {shift down, option down, control down}'
endfunction 
