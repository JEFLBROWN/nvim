local status_ok, fzf = pcall(require, "fzf")
if not status_ok then
	return
end

require("fzf-lua").setup{
  -- MISC GLOBAL SETUP OPTIONS, SEE BELOW
  -- fzf_bin = ...,
  -- each of these options can also be passed as function that return options table
  -- e.g. winopts = function() return { ... } end
  winopts = { -- UI Options
		height           = 0.85,
    width            = 0.80,
    row              = 0.35,
    col              = 0.50,
    border           = "rounded", -- 'rounded' or 'single', 'double', 'sharp', 'none'
    fullscreen       = false,
    preview = {
      layout         = "vertical", -- or 'horizontal', 'flex'
      vertical       = "up:45%",   -- up|down:size
      horizontal     = "right:50%",-- right|left:size
      border         = "noborder", -- or 'border'
      wrap           = "wrap",     -- or 'nowrap'
      hidden         = "nohidden", -- preview window hidden by default?...  
		},
	},
  keymap = { ... },      -- Neovim keymaps / fzf binds
  actions = { ... },     -- Fzf "accept" binds
  fzf_opts = { ... },    -- Fzf CLI flags
  fzf_colors = { ... },  -- Fzf `--color` specification
  hls = { ... },         -- Highlights
  previewers = { ... },  -- Previewers options
  -- SPECIFIC COMMAND/PICKER OPTIONS, SEE BELOW
  -- files = { ... },

keys = {
            { '<leader>f<', '<cmd>FzfLua resume<cr>', desc = 'Resume last fzf command' },
            {
                '<leader>fb',
                function()
                    require('fzf-lua').lgrep_curbuf {
                        winopts = {
                            height = 0.6,
                            width = 0.5,
                            preview = { vertical = 'up:70%' },
                        },
                        fzf_opts = {
                            ['--layout'] = 'reverse',
                        },
                    }
                end,
                desc = 'Grep current buffer',
            },
            { '<leader>fc', '<cmd>FzfLua highlights<cr>', desc = 'Highlights' },
            { '<leader>fd', '<cmd>FzfLua lsp_document_diagnostics<cr>', desc = 'Document diagnostics' },
            { '<leader>fD', '<cmd>FzfLua lsp_workspace_diagnostics<cr>', desc = 'Workspace diagnostics' },
            { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
            { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep' },
            { '<leader>fg', '<cmd>FzfLua grep_visual<cr>', desc = 'Grep', mode = 'x' },
            { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help' },
            {
                '<leader>fr',
                function()
                    -- Read from ShaDa to include files that were already deleted from the buffer list.
                    vim.cmd 'rshada!'
                    require('fzf-lua').oldfiles()
                end,
                desc = 'Recently opened files',
            },
            { 'z=', '<cmd>FzfLua spell_suggest<cr>', desc = 'Spelling suggestions' },
        },


}
