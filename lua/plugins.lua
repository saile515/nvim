vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"

    use {"williamboman/mason.nvim", run = ":MasonUpdate"}

    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "mfussenegger/nvim-dap"
    use {"mhartington/formatter.nvim"}
    use "mfussenegger/nvim-lint"

    use {"ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps"}

    use {"ms-jpq/coq_nvim", branch = "coq"}

    use {"ms-jpq/coq.artifacts", branch = "artifacts"}

    use {"ms-jpq/coq.thirdparty", branch = "3p"}

    use {"catppuccin/nvim", as = "catppuccin"}

    use {
        "nvim-lualine/lualine.nvim",
        requires = {"nvim-tree/nvim-web-devicons", opt = true}
    }

    use {"lewis6991/gitsigns.nvim", tag = 'release'}

    use "folke/trouble.nvim"

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
end)
