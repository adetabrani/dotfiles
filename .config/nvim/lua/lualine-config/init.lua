require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = {},
    component_separators = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        color = {gui='bold'},
      },
    },
    lualine_b = {
      {
        'branch', 
        'diff',
        color = {gui='bold'},
      },
    },
    lualine_c = {
      {
        'filename',
        path = 1,
      },
    },
    lualine_x = {
      { 'diagnostics', 
      sources = {"nvim_lsp"}, 
      symbols = { Error = " ", Warn = " ", Hint = " ", Info = " " } },
    },
    lualine_y = {},
    lualine_z = {}
  },
})
