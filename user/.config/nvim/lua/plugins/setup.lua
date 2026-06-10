 -- Gruvbox 
require("gruvbox").setup({})
vim.cmd.colorscheme("gruvbox")

-- Nvim-tree
require("nvim-web-devicons").setup({})
require("nvim-tree").setup({})

-- Bufferline
require("bufferline").setup({})

-- Toggleterm
require("toggleterm").setup({})

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "basedpyright", "ruff", "clangd", "lua_ls", "bash", "json", "css", "html" },
})

-- Blink
require("blink.cmp").setup({
    keymap = {
        preset = "super-tab",
    }
})


-- Lsp
vim.lsp.enable("basedpyright")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
