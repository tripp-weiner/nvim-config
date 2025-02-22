local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pnf', function()
	builtin.find_files({cwd = vim.fn.getenv("HOME") .. "/Documents/notes"})
end)
vim.keymap.set('n', '<leader>png', function()
	builtin.grep_string({search = "", cwd = vim.fn.getenv("HOME") .. "/Documents/notes"})
end)

vim.keymap.set('n', '<leader>pnt', function()
	local today = os.date("%Y-%m-%d")
	local note_path = vim.fs.joinpath(vim.fn.getenv("HOME"), "Documents", "notes")

	if vim.fn.isdirectory(note_path) == 0 then
		vim.fn.mkdir(note_path, "p")
	end

	local today_journal = vim.fs.joinpath(note_path, today)
	if vim.fn.filereadable(today_journal) == 1 then
		vim.cmd("edit " .. today_journal)
	else
		vim.cmd("edit " .. today_journal)
	end
end)
