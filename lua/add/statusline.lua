function Statusline()
    local colors = {
        git_add = '%#Added#',
        git_change = '%#AlphaHeader#',
        git_remove = '%#AlphaShortcut#',
        mode_normal = '%#MiniStatusLineModeNormal#',
        mode_insert = '%#MiniStatusLineModeInsert#',
        mode_visual = '%#MiniStatusLineModeVisual#',
        mode_visual_line = '%#ModeVisualLine#',
        mode_visual_block = '%#ModeVisualBlock#',
        diagnostic_error = '%#DiagnosticError#',
        diagnostic_warn = '%#DiagnosticWarn#',
        diagnostic_info = '%#DiagnosticInfo#',
        diagnostic_hint = '%#DiagnosticHint#',
        normal = '%#NonText#'
    }

-- Note that: \19 = ^S and \22 = ^V.
    local mode_map = {
  ['n']      = ' NO ', -- Normal
  ['no']     = ' OP ', -- OP-Pending
  ['nov']    = ' OC ', -- OP-Pending
  ['noV']    = ' OL ', -- OP-Pending
  ['no\x16'] = ' OB ', -- OP-Pending
  ['\x16']   = ' VB ', -- 
  ['niI']    = ' IN ', -- Normal
  ['niR']    = ' RE ', -- Normal
  ['niV']    = ' RV ', -- Normal
  ['nt']     = ' NT ', -- Normal
  ['ntT']    = ' TM ', -- Normal
  ['v']      = ' VI ', -- Visual
  ['vs']     = ' VI ', -- Visual
  ['V']      = ' VL ', -- Visual
  ['Vs']     = ' VL ', -- Visual
  ['\x16s']  = ' VB ', -- Visual 
  ['s']      = ' SE ', -- Select
  ['S']      = ' SL ', -- Select
  ['\x13']   = ' SB ', -- 
  ['i']      = ' IN ', -- Insert
  ['ic']     = ' IC ', -- Insert
  ['ix']     = ' IX ', -- Insert
  ['R']      = ' RE ', -- Replace
  ['Rc']     = ' RC ', -- Replace
  ['Rx']     = ' RX ', -- Replace
  ['Rv']     = ' RV ', -- Virt Replace
  ['Rvc']    = ' RC ', -- Virt Replace
  ['Rvx']    = ' RX ', -- Virt Replace
  ['c']      = ' CM ', -- Command
  ['cv']     = ' CV ', -- Vim Ex
  ['r']      = ' PR ', -- Prompt
  ['rm']     = ' PM ', -- More
  ['r?']     = ' P? ', -- Confirm
  ['!']      = ' $_ ', -- Shell
  ['t']      = ' >_ ', -- Terminal
    }

    local mode = mode_map[vim.api.nvim_get_mode().mode] or 'NA'
    local filename = vim.fn.expand('%:t') ~= "" and vim.fn.expand('%:t') or '[No Name]'
    local modified = vim.bo.modified and '🞯' or ''
    local line_count = vim.fn.line('$')

    local function get_git_status()
        local branch = vim.fn.systemlist("git branch --show-current")[1] or ''
        local git_status = vim.fn.systemlist("git diff --numstat")
        local added, changed, removed = 0, 0, 0

        for _, line in ipairs(git_status) do
            local a, c, r = line:match("(%d+)%s+(%d+)%s+(%S+)")
            added = added + (tonumber(a) or 0)
            changed = changed + (tonumber(c) or 0)
            removed = removed + (tonumber(r) or 0)
        end

        if branch and branch ~= '' then
            return string.format('[%s]%s %d%s·%s%d%s·%s%d%s', branch, colors.git_add, added, colors.normal, colors.git_change, changed, colors.normal, colors.git_remove, removed, colors.normal)
        end
        return ''
    end

    local function get_git_root()
        local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if root and root ~= '' then
            return vim.fn.fnamemodify(root, ':t') -- Extracts only the folder name
        end
        return '[No Repo]'
    end

    local function get_lsp_status()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        if #clients == 0 then
            return colors.normal .. '󰩇 ' .. colors.normal -- No LSP icon
        end

        local diagnostics = vim.diagnostic.get(bufnr)
        local severity = {0, 0, 0, 0} -- Errors, Warnings, Info, Hints

        for _, d in ipairs(diagnostics) do
            severity[d.severity] = severity[d.severity] + 1
        end

        local icon = '󰇻 ' -- Default LSP icon
        local hl_group = colors.normal -- Default color

        if severity[1] > 0 then
            hl_group = colors.diagnostic_error -- Errors
        elseif severity[2] > 0 then
            hl_group = colors.diagnostic_warn -- Warnings
        elseif severity[3] > 0 then
            hl_group = colors.diagnostic_info -- Info
        elseif severity[4] > 0 then
            hl_group = colors.diagnostic_hint -- Hints
        end

        return hl_group .. icon .. colors.normal
    end

    local function get_mode_highlight()
        local mode_colors = {
            NO = colors.mode_normal,
            IN = colors.mode_insert,
            VI = colors.mode_visual,
            ['V-LINE'] = colors.mode_visual_line,
            ['V-BLOCK'] = colors.mode_visual_block
        }
        return mode_colors[mode] or colors.mode_normal
    end

    local git_info = get_git_status()
    local project_name = get_git_root()
    local lsp_status = get_lsp_status()
    local mode_highlight = get_mode_highlight()

    return table.concat({
        '', mode_highlight, mode, colors.normal,
        ' ', filename, modified,
        ' %= ', --blank space
        '', line_count, ' lines',
        ' ', project_name,
        ' ', git_info,
        ' ', lsp_status,
        ' '
    })
end

vim.o.statusline = "%!v:lua.Statusline()"
--- 󰩇
---	󰇻󰇻󰇺
---	', right = ''
