require('plugins')

vim.encoding = "UTF-8"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.api.nvim_command('set number')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set relativenumber')
vim.opt.clipboard = "unnamedplus"

local should_format = true;

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

vim.keymap.set("n", "<C-l>", function()
    should_format = not should_format
    print("Should Format:", should_format)
end);
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

local util = require("formatter.util")
local prettier = require("formatter.defaults.prettierd")
local clang_format = require("formatter.defaults.clangformat")

require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.ALL,
    filetype = {
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        css = prettier,
        json = prettier,
        jsonc = prettier,
        svelte = prettier,
        html = prettier,
        svx = prettier,
        markdown = prettier,
        lua = {require("formatter.filetypes.lua").luaformat},
        cpp = clang_format,
        c = clang_format,
        cmake = require("formatter.filetypes.cmake").cmakeformat
    }
}

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    callback = function()
        require("lint").try_lint()
        if (should_format == true) then
            vim.api.nvim_command("FormatWrite")
        end
    end
})

vim.cmd.colorscheme "nord"

vim.cmd("autocmd VimEnter * COQnow --shut-up")
