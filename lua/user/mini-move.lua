local status_ok, move = pcall(require, "move")
if not status_ok then
	return
end
-- No need to copy this inside `setup()`. Will be used automatically.
require('mini.move').setup({

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<A-h>',
    right = '<A-l>',
    down = '<A-j>',
    up = '<A-k>',

    -- Move current line in Normal mode
    line_left = '<A-h>',
    line_right = '<A-l>',
    line_down = '<A-j>',
    line_up = '<A-k>',
  },
})
