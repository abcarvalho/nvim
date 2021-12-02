-- vim: fdm=marker
local kmap = vim.api.nvim_set_keymap
local wk = require("which-key")

-- leader - normal mode {{{1
local lnopts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local leader_mappings = {
-- single mappings {{{2
   -- j = { '<C-W>s', 'split below'},  -- [ADJUST]
   l = {'<C-W>v', 'split right'},
-- List default and user-defined commands
   C = {'<cmd>Telescope commands<cr>', 'list commands'}, -- [ADJUST]
   z = {'<cmd>ZenMode<cr>', 'zen-mode'},
-- }}}2
-- b is for buffers {{{2
  b = {
    name = "+buffer",
    b = {'<cmd>Telescope buffers<cr>', 'list-buffers'},
    d = {"<cmd>bd<cr>", 'delete'},
    n = {"<cmd>bnext<cr>", 'next-buffer'},
    p = {"<cmd>bprevious<cr>", 'previous-buffer'},
    C = {"<cmd>%bd|e#<cr>", 'close-all-but-current'},
  },
-- }}}2
-- c is for config {{{2
  c = {
    name = "+config",
    s = {'<cmd>source $MYVIMRC<CR>', 'source config'},
  },
-- }}}2
-- d is for directory {{{2
  d = {
    name = '+directory',
    d = {'<cmd>cd $DOTFILESDIR<cr>', 'dotfiles'},
    r = {'<cmd>cd $REPOSDIR<cr>', 'repos'},
  },
-- }}}2
-- f is for file {{{2
  f = {
    name = '+file',
    n = {'<cmd>Lexplore<cr>', 'netrw'},
    b = {'file-browser'},
    d = {'DOTFILES'},
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    r = {'REPOS'},
    s = {'<cmd>w<cr>', 'save-file'},
  },
-- }}}2
-- F is for functions {{{2
  F = {
    name = '+functions',
    t = {':call ThemeSwapper() <cr>', 'swap-theme (light/dark)'},
  },
-- }}}2
-- g is for git {{{2
  g = {
    name = 'git',
    t = {
      name = "+telescope",
      c = {'<cmd>Telescope git_bcommits<CR>', 'git-buffer-commits'},
      C = {'<cmd>Telescope git_commits<CR>', 'git-commits'},
      f = {'<cmd>Telescope git_files<CR>', 'git-files'},
      s = {'<cmd>Telescope git_status<CR>', 'git-status'},
      },
    c = {'<cmd>Git commit<CR>', 'commit'},
    p = {'<cmd>G pull<CR>', 'pull'},
    P = {'<cmd>G push<CR>', 'push'},
    s = {'<cmd>G<CR>', 'status'},
    w = {'<cmd>Gwrite<CR>', 'write: save + stage'},
    W = {'<cmd>Gwq<CR>', 'write + exit'},
  },
-- }}}2
-- j is for jupyter {{{2
  j = {
    name = '+jupyter',
    c = {'<cmd>IPython --existing --no-window<cr>', 'connect-qtconsole'},
    r = {'<Plug>(IPy-RunCell)', 'run-cell'},
    R = {'<Plug>(IPy-RunAll)', 'run-all'},
    ['?'] = {'<Plug>(IPy-WordObjInfo)', 'inspect-var-under-cursor'},
    i = {'<Plug>(IPy-Interrupt)', 'interrupt-kernel'},
    t = {'<Plug>(IPy-Terminate)', 'terminate-kernel'},
  },
-- }}}2
-- m is for markdown {{{2
  m = {
    name = 'markdown',
    s = {'shell block'},
    ['1'] = {'header 1'},
    ['2'] = {'header 2'},
    ['3'] = {'header 3'},
    ['4'] = {'header 4'},
    ['5'] = {'header 5'},
    i = {
      name = '+md-insert',
      d = 'date',
      t = 'datetime',
    },
    t = {
      name = '+md-table-mode',
       e = {'<cmd>TableEvalFormulaLine<cr>', 'eval formula line'},
       t = {'<cmd>TableModeEnable<cr>', 'table-mode-enable'},
       d = {'<cmd>TableModeDisable<cr>', 'table-mode-disable'},
    },
  },
-- }}}2
-- p is for packer {{{2
  p = {
    name = '+packer',
    u = {'<cmd>PackerUpdate<cr>', 'update'},
    s = {'<cmd>PackerSync<cr>', 'sync'},
    S = {'<cmd>PackerStatus<cr>', 'status'},
   },
-- }}}2
-- q is for quitting {{{2
  q = {
    name = '+quit',
    u = {'<cmd>wq<cr>', 'save-&-quit'},
    s = {'<cmd>q<cr>', 'quit'},
    S = {'<cmd>qa!<cr>', 'quit-without-saving'},
   },
-- }}}2
-- r is for rgrep {{{2
  r = {
    name = '+rgrep',
    g = {'rgrep-dir'},
    d = {'rgrep-dotfiles-dir'},
    r = {'rgrep-repos-dir'},
   },
-- }}}2
-- s is for search {{{2
  s = {
    name = '+search-telescope',
    ['/'] = {'<cmd>Telescope search_history<CR>', 'search-history'},
    [';'] = {'<cmd>Telescope commands<CR>', 'commands'},
    b = {'<cmd>Telescope current_buffer_fuzzy_find<CR>', 'buffer-fuzzy-find'},
    f = {'<cmd>Telescope find_files<CR>', 'find-files'},
    h = {'<cmd>Telescope oldfiles<CR>', 'file-history'},
    H = {'<cmd>Telescope command_history<CR>', 'command-history'},
    m = {'<cmd>Telescope marks<CR>', 'marks'},
    M = {'<cmd>Telescope keymaps<CR>', 'keymaps'},
    p = {'<cmd>Telescope live_grep<CR>', 'live-project'},  -- ???
    S = {'<cmd>Telescope colorscheme<CR>', 'colorschemes'},
    t = {'<cmd>Telescope current_buffer_tags<CR>', 'tags-current-buffer'},
    T = {'<cmd>Telescope tags<CR>', 'tags-current-buffer'},
    y = {'<cmd>Telescope filtetypes<CR>', 'filteypes'},
    -- B = {'<cmd>Buffers<cr>', 'open-buffers'}
   },
-- }}}2
-- S is for sessions {{{2
  S = {
    name = '+sessions',
    s = {'<cmd>mks! $SESSIONSDIR/session.vim <cr>', 'save'},
    l = {'<cmd>source $SESSIONSDIR/session.vim <cr>', 'load'},
    T = {'<cmd>mks! $SESSIONSDIR/tasks.vim <cr>', 'save-tasks-session'},
    t = {'<cmd>source $SESSIONSDIR/tasks.vim <cr>', 'load-tasks-session'},
  },
-- }}}2
-- <tab> is for tabs {{{2
  ['<tab>'] = {
    name = '+tab',
    ['1'] = {'1gt', 'tab-1'},
    ['2'] = {'2gt', 'tab-2'},
    ['3'] = {'3gt', 'tab-3'},
    ['4'] = {'4gt', 'tab-4'},
    ['5'] = {'5gt', 'tab-5'},
    ['6'] = {'6gt', 'tab-6'},
    ['7'] = {'7gt', 'tab-7'},
    ['8'] = {'8gt', 'tab-8'},
    ['9'] = {'9gt', 'tab-9'},
    ['0'] = {'<cmd>tablast<cr>', 'last'},
    n = {'<cmd>tabnew<cr>', 'new'},
    d = {'<cmd>tabclose<cr>', 'delete'},
    o = {'<cmd>tabonly<cr>', 'close-all-tabs-except-current'},
      },
-- }}}2
-- v is for wiki {{{2
  v = {
    name = '+wikivim',
    v = {'<plug>(wiki-index)', 'wiki-index'},
    j = {'<plug>(wiki-link-next)', 'wiki-link-next'},
    k = {'<plug>(wiki-link-prev)', 'wiki-link-prev'},
    -- f = {'<plug>(wiki-link-follow)', 'wiki-link-follow'},
    -- b = {'<plug>(wiki-link-return)', 'wiki-link-return'},
  },
-- }}}2
-- w is for window {{{2
  w = {
    name = '+window' ,
    w = {'<C-w>w'     , 'other-window'},
    c = {'<C-w>c'     , 'window-close'},
    h = {'<C-w>h'     , 'window-left'},
    j = {'<C-w>j'     , 'window-below'},
    k = {'<C-w>k'     , 'window-right'},
    l = {'<C-w>l'     , 'window-up'},
    H = {'<cmd>vertical resize +2<cr>','expand-window-left' },
    J = {'<cmd>resize -2<cr>','expand-window-below'},
    L = {'<cmd>vertical resize -2<cr>', 'expand-window-right'},
    K = {'<cmd>resize +2<cr>'     ,'expand-window-up'   },
    ['-'] = {'<cmd>split<cr>' , 'split-window-below'},
    ['|'] = {'<cmd>vs<cr>' , 'split-window-right'},
    ['='] ={"<C-w>=", 'balance-window'},
    o = {"<cmd>only<cr>", 'close-all-windows-except-current'},
      },
-- }}}2
-- y is for yanking {{{2
    y = {
      name = '+yank',
      p = {
        name = '+yank-formatted-paragraph(s)',
        ['1'] = {':call YankFormattedPars(1) <cr>', '1 par'},
        ['2'] = {':call YankFormattedPars(2) <cr>', '2 pars'},
        ['3'] = {':call YankFormattedPars(3) <cr>', '3 pars'},
        ['4'] = {':call YankFormattedPars(4) <cr>', '4 pars'},
        ['5'] = {':call YankFormattedPars(5) <cr>', '5 pars'},
      },
      f = {'yank-formatted-file'},
    },
-- }}}2
}
wk.register(leader_mappings, lnopts)
-- }}}1
-- leader - visual mode {{{1
local lvopts = {
    mode = "v", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local leader_v_mappings = {
-- m is for markdown {{{2
  m = {
    name = 'markdown',
    d = {'depth decrease'},  -- visual
    D = {'depth increase'},  -- visual
    },
-- }}}2
}
wk.register(leader_v_mappings, lvopts)
-- }}}1
-- localleader {{{1
local ll_mappings = {
  l = {
    name = '+latex',
  },
}

local llopts = {
    mode = "n", -- NORMAL mode
    prefix = "<localleader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

wk.register(ll_mappings, llopts)
-- }}}1
-- HOME COMPUTER COMMANDS {{{1
if require('utils').is_home_computer() then
-- leader - normal mode {{{2
-- telescope fzf keymappings {{{3
  kmap('n', '<leader>fB',
       ':lua require("ab-telescope").search_dir("AB_DCP_BOX")<CR>',
       {noremap = true})

  kmap('n', '<leader>fg',
       ':lua require("ab-telescope").search_dir("AB_DLZ_GRAPHENE")<CR>',
       {noremap = true})

  kmap('n', '<leader>fm',
       ':lua require("ab-telescope").search_dir("AB_DLZ_ML")<CR>',
       {noremap = true})

  kmap('n', '<leader>fo',
       ':lua require("ab-telescope").search_dir("AB_DLZ_ORG")<CR>',
       {noremap = true})

  -- kmap('n', '<leader>fu',
  --      ':lua require("ab-telescope").search_dir("AB_DBP_UCHICAGO")<CR>',
  --      {noremap = true})

  kmap('n', '<leader>fv',
       ':lua require("ab-telescope").search_dir("AB_DLZ_WIKI")<CR>',
       {noremap = true})

  kmap('n', '<leader>fw',
       ':lua require("ab-telescope").search_dir("AB_DLZ_WORK")<CR>',
       {noremap = true})
--- }}}3
-- telescope rgrep keymappings {{{3
  kmap('n', '<leader>rv',
       ':lua require("ab-telescope").rgrep_dir("AB_DLZ_WIKI")<CR>',
       {noremap = true})

  kmap('n', '<leader>rw',
       ':lua require("ab-telescope").rgrep_dir("AB_DLZ_WORK")<CR>',
       {noremap = true})
--- }}}3

  local osx_leader_mappings = {
-- d is for directory {{{3
    d = {
      name = '+directory',
      k = {'<cmd>cd $AB_DLZ_WORK<cr>', 'work'},
      v = {'<cmd>cd $AB_DLZ_WIKI<cr>', 'wiki'},
    },
-- }}}3
-- f is for file {{{3
    f = {
      name = '+file',
      g = {'AB GRAPHENE'},
      m = {'AB MACHINE LEARNING'},
      a = {'<cmd>edit ${AB_DLZ_WIKI}/tasks.md', 'tasks'},
      B = {'BOX Drive'},
      o = {'AB ORG'}, -- '<cmd>edit ${AB_ORG_DIR}/networking.org<cr>', 'networking-org'},
      p = {'<cmd>edit ${REPOSDIR}/dissertation/paper/abcarvalho_paper.tex<cr>', 'paper-thesis'},
      u = {'AB UCHICAGO'},
      v = {'AB WIKI'},
      w = {'AB WORK'},
    },
-- }}}3
-- r is for rgrep {{{3
    r = {
      name = '+rgrep',
      v = {'rgrep-wiki-dir'},
      w = {'rgrep-work-dir'},
     },
-- }}}3
  }
  wk.register(osx_leader_mappings, lnopts)
-- }}}2
end
-- }}}1
-- PRIVATE COMMANDS {{{1
if require('utils').has_private_settings() then
  vim.cmd([[source $LUADIR/private-config.lua]])

  local privatus_leader_mappings = {
-- a is for acropolis {{{2
    a = {
      name = '+acropolis-server',
      d = {"<cmd> lua require('utils').scp_repo('bond-data') <cr>", 'bond-data'},
      m = {"<cmd> lua require('utils').scp_repo('bond-model') <cr>", 'bond-model'},
    },
  }
-- }}}2
  wk.register(privatus_leader_mappings, lnopts)
  end
-- }}}1
