require('plugins')

vim.encoding = "UTF-8"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.api.nvim_command('set number')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set relativenumber')
vim.opt.clipboard = "unnamedplus"

-- Keybinds
vim.keymap.set("n", "<C-s>", ":w<Enter>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<Enter>")

vim.keymap.set("n", "<F17>",
               ":!cmake -S . -B build && cmake --build build<Enter>")
vim.keymap.set("n", "<F5>", ":!cmake --build build<Enter>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-e>", function() require("trouble").toggle() end)

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<C-f>", telescope.find_files, {})

vim.keymap.set("n", "<C-t>", ":CHADopen<Enter>");
-- !Keybinds

require("lualine").setup()
require("gitsigns").setup()

local coq = require("coq")
local lsp = require("lspconfig")
local mason_lsp = require("mason-lspconfig")

require("mason").setup()
mason_lsp.setup()
mason_lsp.setup_handlers {
    function(server_name)
        lsp[server_name].setup(coq.lsp_ensure_capabilities())
    end
}

lsp.clangd.setup {settings = {clangd = {arguments = {"-std=c++20"}}}}

local prettier = require("formatter.defaults.prettierd")

require("formatter").setup {
    filetype = {
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        css = prettier,
        json = prettier,
        svelte = prettier,
        html = prettier,
        markdown = prettier,
        lua = {require("formatter.filetypes.lua").luaformat},
        cpp = require("formatter.defaults.clangformat")
    }
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    callback = function() require("lint").try_lint() end
})

vim.cmd.colorscheme "catppuccin-mocha"

vim.cmd("autocmd BufWritePost * FormatWrite")
vim.cmd("autocmd VimEnter * COQnow --shut-up")
