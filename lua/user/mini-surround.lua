local status_ok, surround = pcall(require, "surround")
if not status_ok then
  return
end

require('mini.surround').setup({

{
  -- Add custom surroundings to be used on top of builtin ones. For more
  -- information with examples, see `:h MiniSurround.config`.
  custom_surroundings = nil,

  -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  highlight_duration = 500,

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = 'sa', -- Add surrounding in Normal and Visual modes
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding
    update_n_lines = 'sn', -- Update `n_lides`

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },

  -- Number of lines within which surrounding is searched
  n_lines = 20,

  -- How to search for surrounding (first inside current line, then inside
  -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
  -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
  -- see `:h MiniSurround.config`.
  search_method = 'cover',
}
})



-- # Example usage~
--
-- Regular mappings:
-- - `saiw)` - add (`sa`) for inner word (`iw`) parenthesis (`)`).
-- - `saiwi[[<CR>]]<CR>` - add (`sa`) for inner word (`iw`) interactive
--   surrounding (`i`): `[[` for left and `]]` for right.
-- - `2sdf` - delete (`sd`) second (`2`) surrounding function call (`f`).
-- - `sr)tdiv<CR>` - replace (`sr`) surrounding parenthesis (`)`) with tag
--   (`t`) with identifier 'div' (`div<CR>` in command line prompt).
-- - `sff` - find right (`sf`) part of surrounding function call (`f`).
-- - `sh}` - highlight (`sh`) for a brief period of time surrounding curly
--   brackets (`}`).
--
-- Extended mappings (temporary force "prev"/"next" search methods):
-- - `sdnf` - delete (`sd`) next (`n`) function call (`f`).
-- - `srlf(` - replace (`sd`) last (`l`) function call (`f`) with padded
--   bracket (`(`).
-- - `2sfnt` - find (`sf`) second (2) next (`n`) tag (`t`).
-- - `shl}` - highlight (`sh`) last (`l`) second (`2`) curly bracket (`}`).
