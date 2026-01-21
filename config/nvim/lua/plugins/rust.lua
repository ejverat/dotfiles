return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        rust_analyzer = {},
      },
    },
  },
  {
    -- Ensure rust debugger is installed
    "mason-org/mason.nvim",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "rust-analyzer" })
      end
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^7",
    lazy = false,
    config = function()
      local mason_root = vim.fn.stdpath("data") .. "/mason"
      local extension_path = mason_root .. "/packages/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      local cfg = require("rustaceanvim.config")

      vim.g.rustacenvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
  },
}
