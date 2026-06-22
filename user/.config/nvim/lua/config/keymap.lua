-- Vanilla
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>x<CR>")


vim.keymap.set("n", "<C-h>", ":%s/")
vim.keymap.set("n", "<leader>cl", "<cmd>noh<CR>")

-- Nvim Tree
vim.keymap.set({"i", "n"}, "<C-e>", "<cmd>NvimTreeToggle<CR>")


-- Toggle Term
vim.keymap.set({"i", "n"}, "<C-j>", "<cmd>ToggleTerm<CR>")


-- Buffer Line
for i = 1, 9 do
    vim.keymap.set({"n", "i"},
    "<A-" .. i .. ">",
    "<cmd>BufferLineGoToBuffer " .. i .. "<CR>")
end

vim.keymap.set({"n", "i"}, "<A-h>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set({"n", "i"}, "<A-l>", "<cmd>BufferLineCycleNext<CR>")


-- Unbind Arrows
for _, arrow in ipairs({"Up", "Down", "Left", "Right"}) do
    vim.keymap.set({"n", "i", "v"}, "<" .. arrow .. ">", "<Nop>")
end

-- Diagnostics
vim.keymap.set({"n", "i"}, "<C-d>", vim.diagnostic.open_float)

-- LSP
vim.keymap.set({"i", "n"}, "<C-l>",vim.lsp.buf.hover)
