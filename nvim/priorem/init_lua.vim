" lua require('ac-neorg')
"
" " NOTE: You can use other key to expand snippet.
" 
" " Expand
" imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" 
" " Expand or jump
" imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" 
" " Jump forward or backward
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" 
" " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" " See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)
"
"    -- fzf (remove)
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
    use 'junegunn/fzf.vim'

" FZF Plugin Maps {{{2
" Fuzzy Search
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" }}}2

    use {'ajmwagar/vim-deus', opt=true}
    use 'bfredl/nvim-ipy'

   -- Folding
    -- use {"arecarn/vim-fold-cycle", opt=true,
    --      ft={'md', 'markdown', 'pandoc', 'txt', 'vim', 'lua', 'tex', 'latex'}}
    -- use "arecarn/vim-fold-cycle"


    require_plugin('arecarn/vim-fold-cycle')

    use {'kristijanhusak/orgmode.nvim', config = function()
            require('orgmode').setup({
              org_agenda_files = {'$AB_ORG_DIR/*', },
              org_default_notes_file = {'${AB_ORG_DIR}/refile.org'},
              org_todo_keywords = {'TODO', 'NEXT', 'WAITING', '|', 'DONE', 'CANCELLED'},
              org_archive_location = {'${AB_ORG_DIR}/archive.org'},
              org_highlight_latex_and_related = 'entities',
            --   mappings = {
            --     capture = {
            --       org_capture_finalize = '<Leader>oCw',
            --       org_capture_refile = '<Leader>oCr',
            --       org_capture_kill = '<Leader>oCk',
            --       org_capture_show_help = '<Leader>oC?'
            -- }
          -- }
        })
      end
      }



-- o is for org {{{2
  o = {
    name = '+org-mode',
    a = {'agenda'},
    A = {'archive-tag'},
    ['$'] = {'archive-subtree'},
    c = {'capture-prompt'},
    r = {'capture-refile'},
    k = {'capture-abort'},
    w = {'capture-finalize'},
    ['?'] = {'capture-help'},
    o = {'open-link/date'},
    t = {'tags'},
    K = {'move-subtree-up'},
    J = {'move-subtree-down'},
    e = {'export'},
    i = {
      name = '+org-insert',
      h = {'headline'},
      t = {'TODO (after current headline and contents)'},
      T = {'TODO (after current headline)'},
    },
   },
-- }}}2


--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end


