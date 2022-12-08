-- telescope

vim.api.nvim_set_keymap('n','<Leader>ff',[[<Cmd>Telescope find_files<CR>]],{noremap = true})
vim.api.nvim_set_keymap('n','<Leader>fg',[[<Cmd>Telescope live_grep<CR>]],{noremap = true})
vim.api.nvim_set_keymap('n','<Leader>fb',[[<Cmd>Telescope buffers<CR>]],{noremap = true})
vim.api.nvim_set_keymap('n','<Leader>fh',[[<Cmd>Telescope help_tags<CR>]],{noremap = true})

-- dap
vim.keymap.set('n','<F5>',":lua require'dap'.continue()<CR>")
vim.keymap.set('n','<F10>',":lua require'dap'.step_over()<CR>")
vim.keymap.set('n','<F11>',":lua require'dap'.step_into()<CR>")
vim.keymap.set('n','<F12>',":lua require'dap'.step_out()<CR>")
vim.keymap.set('n','<F8>',":lua require'dap'.terminate({cb = require('dapui').close()})<CR>")
vim.keymap.set('n','<leader>b',":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n','<leader>B',":lua require'dap'.set_breakpoint(vim.fn.input('B condition: '))<CR>")
vim.keymap.set('n','<leader>lp',":lua require'dap'.set_breakpoint(nil,nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set('n','<leader>dr',":lua require'dap'.repl.open()<CR>")
vim.keymap.set('n','<leader>ev',":lua require'dapui'.eval()<CR>")

-- lsp

vim.keymap.set('n','<leader>e',":lua vim.diagnostic.open_float()<CR>")

-- init dap (move to another file)
local dap = require('dap')

dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = '/home/user/software/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7'
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		args = function()
			local cmd_args = {}
			local carg = nil
			repeat
				vim.ui.input({prompt = 'Add argument(empty = No)?: ', default = ""}, function(input)
					if input then
						table.insert(cmd_args, input)
					end
					carg = input
				end)
			until carg == nil
			return cmd_args
		end,
		cwd = '${workspaceFolder}',
		stopAtEntry = true,
		setupCommands = {  
			{ 
				text = '-enable-pretty-printing',
				description =  'enable pretty printing',
				ignoreFailures = false 
			},
		},
	},
	{
		name = 'Attach to gdbserver :1234',
		type = 'cppdbg',
		request = 'launch',
		MIMode = 'gdb',
		miDebuggerServerAddress = 'localhost:1234',
		miDebuggerPath = '/usr/bin/gdb',
		cwd = '${workspaceFolder}',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		setupCommands = {  
			{ 
				text = '-enable-pretty-printing',
				description =  'enable pretty printing',
				ignoreFailures = false 
			},
		},
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('nvim-dap-virtual-text').setup()
require("dapui").setup()

local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  print("Session terminated")
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  print("Session ended")
	dapui.close()
end
