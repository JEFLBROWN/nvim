local status_ok, statusline = pcall(require, 'statusline')
if not status_ok then
	return
end

-- No need to copy this inside `setup()`. Will be used automatically.

require ('statusline').setup {

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
}
