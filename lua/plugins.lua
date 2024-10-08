local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    {"williamboman/mason.nvim"}, "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", "mfussenegger/nvim-dap",
    {"mhartington/formatter.nvim"}, "mfussenegger/nvim-lint",
    {"ms-jpq/chadtree", branch = "chad"}, {"ms-jpq/coq_nvim", branch = "coq"},
    {"ms-jpq/coq.artifacts", branch = "artifacts"},
    {"ms-jpq/coq.thirdparty", branch = "3p"}, "shaunsingh/nord.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    }, {"lewis6991/gitsigns.nvim", tag = "release"}, "folke/trouble.nvim", {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {"nvim-lua/plenary.nvim"}
    }, "evanleck/vim-svelte", "tikhomirov/vim-glsl"
})
