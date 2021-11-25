-- telescope

vim.api.nvim_set_keymap('n','<Leader>ff',[[<Cmd>Telescope find_files<CR>]],{noremap = true})
vim.api.nvim_set_keymap('n','<Leader>fg',[[<Cmd>Telescope live_grep<CR>]],{noremap = true})
vim.api.nvim_set_keymap('n','<Leader>fb',[[<Cmd>Telescope buffers<CR>]],{noremap = true})
vim.api.nvim_set_keymap('n','<Leader>fh',[[<Cmd>Telescope help_tags<CR>]],{noremap = true})
