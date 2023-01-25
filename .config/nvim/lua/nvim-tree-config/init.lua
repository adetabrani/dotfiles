vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
      underline = true,
      virtual_text = {
          spacing = 5,
          severity_limit = 'Warning',
      },
      update_in_insert = true,
  }
)

require 'nvim-tree'.setup {
  auto_reload_on_write = true,
  view = {
    number = true,
    relativenumber = true, 
  },
}
