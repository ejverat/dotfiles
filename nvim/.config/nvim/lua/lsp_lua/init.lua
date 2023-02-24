local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function()
  vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})
  vim.keymap.set("n","gd",vim.lsp.buf.definition,{buffer=0})
  vim.keymap.set("n","gi",vim.lsp.buf.implementation,{buffer=0})
  vim.keymap.set("n","<leader>dj",vim.diagnostic.goto_next,{buffer=0})
  vim.keymap.set("n","<leader>dk",vim.diagnostic.goto_prev,{buffer=0})
  vim.keymap.set("n","<leader>dl","<cmd>Telescope diagnostics<cr>",{buffer=0})
  vim.keymap.set("n","<leader>r",vim.lsp.buf.rename,{buffer=0})
  vim.keymap.set("n","<leader>lr","<cmd>Telescope lsp_references<cr>",{buffer=0})
end

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "rustup", "run", "stable", "rust-analyzer",
  }
}
