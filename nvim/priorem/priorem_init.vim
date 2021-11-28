" vim: set fdm=marker : 

" set paths {{{1
let $DOTFILESDIR=$AB_DLZ_DOTFILES
let $LUADIR=$DOTFILESDIR ."/nvim/lua"
let $SESSIONSDIR=$AB_DIP_ZEN ."/tmp"
let $REPOSDIR=$AB_DIZ_REPOS
" }}}1
" Settings {{{1
set debug=msg
syntax enable

set formatoptions-=cro                  " Stop newline continuation of comments

set spell

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" Enable autocompletion:
set wildmode=longest,list,full

" set wrap linebreak nolist               " Soft wrap
" }}}1
" source plugin and other configs {{{1
lua require('init')
" lua require('utils')
" lua require('plugins')
" lua require('ab-filetype')
" lua require('ab-telescope')
" 
" " lua << EOF
" "   os_name = require('utils').get_os_name()
" "   -- print(os_name)
" " 
" "   if is 
" " EOF
" " echo 'printing the os name: ' .$os_name
" 
" source $LUADIR/ab-funs.vim
" source $LUADIR/ab-ipy/init.vim
" source $LUADIR/ab-netrw/init.vim
" source $LUADIR/ab-pandoc/init.vim
" source $LUADIR/ab-julia/init.vim
" source $LUADIR/ab-vimtex/init.vim
" lua require('colorscheme')
" 
" lua require('ab-gitsigns')
" lua require('ab-autopairs')
" lua require('ab-bullets')
" lua require('ab-comment')
" lua require('ab-blankline')
" lua require('ab-wiki')
" lua require('ab-zen')
" lua require('ab-lightspeed')
" 
" lua require('keymappings')
" lua require('ab-which-key')
" 
" lua require('settings')
" lua require('ab-lsp')
" lua require('ab-treesitter')
" 
" " autocompletion
" set completeopt=menu,menuone,noselect
" lua require('ab-cmp')
" }}}1
