require("yanky").setup({
  ring = {
    history_length = 100,
    storage = "shada",
    sync_with_numbered_registers = true,
    cancel_event = "update",
    ignore_registers = { "_" },
    update_register_on_cycle = false,
    permanent_wrapper = nil,
  },
  system_clipboard = {
    sync_with_ring = true,
  },
})


-- return {
--     'gbprod/yanky.nvim',
--     opts = {
--         ring = { history_length = 20 },
--         highlight = { timer = 250 },
--     },
--     keys = {
--         { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
--         { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
--         { '=p', '<Plug>(YankyPutAfterLinewise)', desc = 'Put yanked text in line below' },
--         { '=P', '<Plug>(YankyPutBeforeLinewise)', desc = 'Put yanked text in line above' },
--         { '[y', '<Plug>(YankyCycleForward)', desc = 'Cycle forward through yank history' },
--         { ']y', '<Plug>(YankyCycleBackward)', desc = 'Cycle backward through yank history' },
--         { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yanky yank' },
--     },
-- }
