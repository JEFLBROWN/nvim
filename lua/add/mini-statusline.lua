require('mini.statusline').setup({
  -- Whether to set Vim's settings for statusline (make it always visible)
  set_vim_settings = true,  -- recommended

  -- Custom content for different sections
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git           = MiniStatusline.section_git({ trunc_width = 75 })
      local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local location      = MiniStatusline.section_location({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl,                 strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, } },
        '%<', -- truncation point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
				'%=',
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        -- { hl = 'MiniStatuslineLocation', strings = { location } },
      })
    end,
  },
})
