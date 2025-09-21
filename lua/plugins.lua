return {
	{
		"nordtheme/vim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme nord]])
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(
				opts.ensure_installed or {},
				{
					"cspell",
					"prettierd",
					"clangd",
					"stylua",
					"clang-format",
					"lua-language-server",
					"typescript-language-server",
				}
			)
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {},
		},
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
	{
		"nvim-telescope/telescope.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
	},
}
