local M = {}

local function read_palette()
    local path = vim.fn.expand("~/.config/hypr/scheme/current.conf")
    local colors = {}

    local ok, lines = pcall(vim.fn.readfile, path)
    if not ok then
        vim.notify("Could not read " .. path, vim.log.levels.ERROR)
        return colors
    end

    for _, line in ipairs(lines) do
        local key, value = line:match("^%$(.-)%s*=%s*(%x+)$")
        if key and value then
            colors[key] = "#" .. value
        end
    end

    return colors
end

function M.setup()
    vim.cmd("highlight clear")
    vim.g.colors_name = "caelestia"

    local c = read_palette()
    local hl = vim.api.nvim_set_hl

    -- editor
    hl(0, "Normal",       { fg = c.text, bg = c.base })
    hl(0, "NormalFloat",  { fg = c.text, bg = c.surface })
    hl(0, "FloatBorder",  { fg = c.outline, bg = c.surface })
    hl(0, "CursorLine",   { bg = c.surface0 })
    hl(0, "CursorColumn", { bg = c.surface0 })
    hl(0, "ColorColumn",  { bg = c.surface0 })
    hl(0, "LineNr",       { fg = c.overlay1 })
    hl(0, "CursorLineNr", { fg = c.primary, bold = true })
    hl(0, "SignColumn",   { bg = c.base })
    hl(0, "StatusLine",   { fg = c.text, bg = c.surface1 })
    hl(0, "StatusLineNC", { fg = c.overlay1, bg = c.surface0 })
    hl(0, "VertSplit",    { fg = c.surface2 })
    hl(0, "WinSeparator", { fg = c.surface2 })
    hl(0, "Visual",       { bg = c.primaryContainer })
    hl(0, "Search",       { fg = c.onPrimaryContainer, bg = c.primaryContainer })
    hl(0, "IncSearch",    { fg = c.onPrimary, bg = c.primary })
    hl(0, "Pmenu",        { fg = c.text, bg = c.surface })
    hl(0, "PmenuSel",     { fg = c.onPrimary, bg = c.primary })

    -- syntax
    hl(0, "Comment",    { fg = c.overlay1, italic = true })
    hl(0, "Constant",   { fg = c.peach })
    hl(0, "String",     { fg = c.green })
    hl(0, "Character",  { fg = c.green })
    hl(0, "Number",     { fg = c.peach })
    hl(0, "Boolean",    { fg = c.peach })
    hl(0, "Identifier", { fg = c.text })
    hl(0, "Function",   { fg = c.blue })
    hl(0, "Statement",  { fg = c.mauve })
    hl(0, "Conditional",{ fg = c.mauve })
    hl(0, "Repeat",     { fg = c.mauve })
    hl(0, "Operator",   { fg = c.sky })
    hl(0, "Keyword",    { fg = c.mauve })
    hl(0, "Type",       { fg = c.yellow })
    hl(0, "Special",    { fg = c.pink })
    hl(0, "Delimiter",  { fg = c.overlay2 })

    -- diagnostics
    hl(0, "DiagnosticError", { fg = c.red })
    hl(0, "DiagnosticWarn",  { fg = c.yellow })
    hl(0, "DiagnosticInfo",  { fg = c.blue })
    hl(0, "DiagnosticHint",  { fg = c.teal })

    hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
    hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
    hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
    hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = c.teal })

    -- diff
    hl(0, "DiffAdd",    { bg = c.successContainer })
    hl(0, "DiffChange", { bg = c.secondaryContainer })
    hl(0, "DiffDelete", { bg = c.errorContainer })
    hl(0, "DiffText",   { bg = c.primaryContainer })

    -- git
    hl(0, "GitSignsAdd",    { fg = c.green })
    hl(0, "GitSignsChange", { fg = c.yellow })
    hl(0, "GitSignsDelete", { fg = c.red })

    -- telescope
    hl(0, "TelescopeNormal",       { fg = c.text, bg = c.surface })
    hl(0, "TelescopeBorder",       { fg = c.outline, bg = c.surface })
    hl(0, "TelescopeSelection",    { bg = c.surface1 })
    hl(0, "TelescopeMatching",     { fg = c.primary })

    -- nvim-cmp
    hl(0, "CmpItemAbbrMatch",      { fg = c.primary, bold = true })
    hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.primary })
    hl(0, "CmpItemKind",           { fg = c.blue })
end

return M
