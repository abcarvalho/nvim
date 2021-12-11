local g = vim.g

-- LaTeX - Vimtex
g.vimtex_enabled = 1
g.vimtex_complete_recursive_bib = 1
g.tex_flavor = 'latex'
g.vimtex_view_method = 'zathura'
g.vimtex_compiler_progname = 'nvr'  -- required in neovim 
g.vimtex_quickfix_mode = 0
g.vimtex_complete_img_use_tail = 1
g.vimtex_fold_enabled = 1
g.vimtex_format_enabled = 1

vim.cmd([[
  let g:vimtex_compiler_latexmk={'options' : ['-shell-escape', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode',],}
]])

-- Tex Conceal
-- g.tex_conceal='abdmg'
-- set conceal level to zero in latex files
g.tex_conceal=""

-- vim.cmd([[
--   augroup VimTeX
--     autocmd!
--     autocmd FileType tex
--           \ lua require('cmp').setup.buffer { sources = { { name = 'omni' } } }
--   augroup END
-- ]])

-- include other plugins as well, not just omni if you want them to work.
vim.cmd(string.gsub([[
autocmd FileType tex lua require('cmp').setup.buffer{
sources = {
{ name = 'omni' },
}
}
]], '\n', ' '))

