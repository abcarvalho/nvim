require('orgmode').setup({
      org_agenda_files = {'$AB_DBZ_ORG/*', },
      org_default_notes_file = {'${AB_DBZ_ORG}/refile.org'},
      org_todo_keywords = {'TODO', 'NEXT', 'WAITING', '|', 'DONE', 'CANCELLED'},
      org_archive_location = {'${AB_DBZ_ORG}/archive.org'},
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

require("org-bullets").setup({
    symbols = { "◉", "○", "✸", "✿" },
})
