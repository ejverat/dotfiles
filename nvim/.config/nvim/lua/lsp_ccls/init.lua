-- Add additional capabilities supported by nvim-cmp
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require'lspconfig'
lspconfig.ccls.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})
		vim.keymap.set("n","gd",vim.lsp.buf.definition,{buffer=0})
		vim.keymap.set("n","gi",vim.lsp.buf.implementation,{buffer=0})
		vim.keymap.set("n","<leader>dj",vim.diagnostic.goto_next,{buffer=0})
		vim.keymap.set("n","<leader>dk",vim.diagnostic.goto_prev,{buffer=0})
		vim.keymap.set("n","<leader>dl","<cmd>Telescope diagnostics<cr>",{buffer=0})
		vim.keymap.set("n","<leader>r",vim.lsp.buf.rename,{buffer=0})
		vim.keymap.set("n","<leader>lr","<cmd>Telescope lsp_references<cr>",{buffer=0})
	end,
	init_options = {
		compilationDatabaseDirectory = "build";
		index = {
			threads = 0;
		};
		clang = {
			excludeArgs = { "-frounding-math"} ;
		};
	}
}

vim.opt.completeopt={"menu","menuone","noselect"}

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })
