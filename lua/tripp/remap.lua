vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Rex)
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set({"n", "v"}, "<leader>;", "[[:let @+ = expand('%')<CR>]]")
vim.keymap.set("v", "<leader>/", [[:s;^\(\s*\)\(.\);\1// \2;<CR>]])

 vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
   expr = true,
   replace_keycodes = false
 })
 vim.g.copilot_no_tab_map = true
