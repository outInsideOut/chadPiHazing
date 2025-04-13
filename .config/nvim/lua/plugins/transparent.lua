return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      groups = {
        -- default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
      extra_groups = {
        "NormalFloat",     -- for plugins with float panels like Lazy, Mason, LspInfo
        "NvimTreeNormal",  -- for NvimTree
      },
      exclude_groups = {}, -- groups you don't want to clear
    })
  end,
}
