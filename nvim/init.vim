" vim: set fdm=marker : 

" Settings {{{1
filetype plugin on
    
syntax enable

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

set formatoptions-=cro                  " Stop newline continuation of comments

" Move normally between wrapped lines
:map j gj
:map k gk
:map 0 g0
:map $ g$

set spell

set iskeyword+=-                      	" treat dash separated words as a word text object"

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" Enable autocompletion:
set wildmode=longest,list,full

" ****** Key Behavior *****
set backspace=2 " make backspace work like most other programs

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set wrap linebreak nolist               " Soft wrap
" }}}1
lua require('plugins')
lua require('ac-telescope')

" Appearance: {{{1
" Ensure transparency
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi NonText ctermbg=none guibg=none

if (has("termguicolors"))
    set termguicolors
endif
" }}}1
source ${AB_DLZ_DOTFILES}/nvim/lua/ac-ipy/init.vim
source ${AB_DLZ_DOTFILES}/nvim/lua/ac-netrw/init.vim
source ${AB_DLZ_DOTFILES}/nvim/lua/ac-pandoc/init.vim
source ${AB_DLZ_DOTFILES}/nvim/lua/ac-julia/init.vim
source ${AB_DLZ_DOTFILES}/nvim/lua/ac-vimtex/init.vim
lua require('ac-gitsigns')
lua require('ac-lsp')
lua require('ac-treesitter')
lua require('ac-autopairs')
lua require('ac-bullets')
lua require('ac-comment')
lua require('ac-blankline')
lua require('ac-wiki')
lua require('ac-zen')
lua require('ac-lightspeed')
lua require('ac-orgmode')

lua require('keymappings')
lua require('ac-which-key')

lua require('settings')
lua require('colorscheme')

" lua require('lsp.lua-ls')
