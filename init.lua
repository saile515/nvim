require('plugins')

vim.encoding = "UTF-8"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.api.nvim_command('set number')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set expandtab')
vim.keymap.set("n", "<C-s>", ":w<Enter>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<Enter>li")
vim.cmd[[colorscheme vscode]]

require('lualine').setup()
require('gitsigns').setup()

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end
}

require "lspconfig".clangd.setup {
    settings = {
        clangd = {
            arguments = {"-std=c++20"}
        }
    }
}

require("null-ls").setup()

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.cmd("autocmd VimEnter * cd ~/Documents/projects")
vim.cmd("autocmd VimEnter * CHADopen --nofocus")
vim.cmd("autocmd VimEnter * COQnow --shut-up")
