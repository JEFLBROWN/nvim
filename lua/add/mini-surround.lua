local status_ok, surround = pcall(require, 'mini.surround')
if not status_ok then
	return
end

require('mini.surround').setup {

  -- Add custom surroundings to be used on top of builtin ones. For more
  -- information with examples, see `:h MiniSurround.config`.
  custom_surroundings = nil,

  -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  highlight_duration = 200,

-- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = '<leader>sa', -- Add surrounding in Normal and Visual modes
    delete = '<leader>sd', -- Delete surrounding
		replace = '<leader>sr', -- Replace surrounding
		update_n_lines = '<leader>sn', -- Update `n_lines`
    find = '', -- Find surrounding (to the right)
    find_left = '', -- Find surrounding (to the left)
    highlight = '', -- Highlight surrounding

    suffix_last = '', -- Suffix to search with "prev" method
    suffix_next = '', -- Suffix to search with "next" method
  },

  -- Number of lines within which surrounding is searched
  n_lines = 20,

  -- How to search for surrounding (first inside current line, then inside
  -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
  -- 'cover_or_nearest', "next", 'prev', 'nearest'. For more details,
  -- see `:h MiniSurround.config`.
  search_method = 'cover',
}

