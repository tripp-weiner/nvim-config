local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.grep_string)

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)

vim.keymap.set('n', '<leader>en', function()
	builtin.find_files({
		cwd = vim.fn.stdpath("config"),
		find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
	})
end)
