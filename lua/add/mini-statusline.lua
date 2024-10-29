local status_ok, statusline = pcall(require, 'statusline')
if not status_ok then
 return
end

-- local M = {} 

require('mini.statusline').setup(

	-- -- display "RECORDING" for macros in statusline
	-- use_icons = vim.g.have_nerd_font,
	-- content = {
	-- 	active = function()
	-- 		local check_macro_recording = function()
	-- 			if vim.fn.reg_recording() ~= "" then
	-- 				return "Recording @" .. vim.fn.reg_recording()
	-- 			else
	-- 				return ""
	-- 			end
	-- 		end

			-- local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			-- local git = MiniStatusline.section_git({ trunc_width = 40 })
			-- local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			-- local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			-- -- local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			-- local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			-- local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			-- local location = MiniStatusline.section_location({ trunc_width = 200 })
			-- local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
			-- local macro = check_macro_recording()

	-- 		return MiniStatusline.combine_groups({
	-- 			{ hl = mode_hl, strings = { mode } },
	-- 			{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
	-- 			"%<", -- Mark general truncate point
	-- 			{ hl = "MiniStatuslineFilename", strings = { filename } },
	-- 			"%=", -- End left alignment
	-- 			{ hl = "MiniStatuslineFilename", strings = { macro } },
	-- 			{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
	-- 			{ hl = mode_hl, strings = { search, location } },
	-- 		})
	-- 	end,
	-- }, -- end macro recording display


	-- -- local mode = {
	-- -- 	['n']      = 'NO', -- Normal
	-- -- 	['no']     = 'OP', -- 
	-- -- 	['nov']    = 'OC',
	-- -- 	['noV']    = 'OL',
	-- -- 	['no\x16'] = 'OB',
	-- -- 	['\x16']   = 'VB',
	-- -- 	['niI']    = 'IN',
	-- -- 	['niR']    = 'RE',
	-- -- 	['niV']    = 'RV',
	-- -- 	['nt']     = 'NT',
	-- -- 	['ntT']    = 'TM',
	-- -- 	['v']      = 'VI',
	-- -- 	['vs']     = 'VI',
	-- -- 	['V']      = 'VL',
	-- -- 	['Vs']     = 'VL',
	-- -- 	['\x16s']  = 'VB',
	-- -- 	['s']      = 'SE',
	-- -- 	['S']      = 'SL',
	-- -- 	['\x13']   = 'SB',
	-- -- 	['i']      = 'IN',
	-- -- 	['ic']     = 'IC',
	-- -- 	['ix']     = 'IX',
	-- -- 	['R']      = 'RE',
	-- -- 	['Rc']     = 'RC',
	-- -- 	['Rx']     = 'RX',
	-- -- 	['Rv']     = 'RV',
	-- -- 	['Rvc']    = 'RC',
	-- -- 	['Rvx']    = 'RX',
	-- -- 	['c']      = 'CO',
	-- -- 	['cv']     = 'CV',
	-- -- 	['r']      = 'PR',
	-- -- 	['rm']     = 'PM',
	-- -- 	['r?']     = 'P?',
	-- -- 	['!']      = 'SH',
	-- -- 	['t']      = 'TE',
	-- -- },

  -- Content of statusline as functions which return statusline string. See
  -- `:h statusline` and code of default contents (used instead of `nil`).
  content = {
			-- Content for active window
    active = nil,
    -- Content for inactive window(s)
    inactive = nil,
  },

  -- Whether to use icons by default
  use_icons = true,

  -- Whether to set Vim's settings for statusline (make it always shown)
  set_vim_settings = true,

)
