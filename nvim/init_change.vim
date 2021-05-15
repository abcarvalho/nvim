" vim: set fdm=marker : 

let $NVIM_CONFIG_DIR = expand('$ZEN_DOTFILES_DIR/nvim')

if has('nvim-0.5')
    " nightly config
    source $NVIM_CONFIG_DIR/nightly.vim
else
    " stable config
    source $NVIM_CONFIG_DIR/stable_init.vim
endif

