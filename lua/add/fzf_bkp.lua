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
  keymap = {},      -- Neovim keymaps / fzf binds
  actions = { ...  },     -- Fzf "accept" binds
  fzf_opts = { ...  },    -- Fzf CLI flags
  fzf_colors = { ...  },  -- Fzf `--color` specification
  hls = { ...  },         -- Highlights
  previewers = { ...  },  -- Previewers options
  -- SPECIFIC COMMAND/PICKER OPTIONS, SEE BELOW
  -- files = { ... },
}
