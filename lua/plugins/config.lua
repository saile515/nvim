return {
    { "arcticicestudio/nord-vim" },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "nord",
        },
    },

    {
        import = "lazyvim.plugins.extras.lang.typescript",
        {
            "neovim/nvim-lspconfig",
            opts = {
                servers = {
                    vtsls = {
                        settings = {
                            typescript = {
                                inlayHints = {
                                    enumMemberValues = { enabled = true },
                                    functionLikeReturnTypes = { enabled = false },
                                    parameterNames = { enabled = "literals" },
                                    parameterTypes = { enabled = false },
                                    propertyDeclarationTypes = { enabled = true },
                                    variableTypes = { enabled = false },
                                },
                            },
                        },
                    },
                },
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "tsx",
                "typescript",
            })
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {},
        },
    },
}
