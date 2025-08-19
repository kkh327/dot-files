return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"terraformls",
					"tflint",
					"jdtls",
					"omnisharp",
					"clangd",
					"html",
					"cssls",
					"emmet_ls",
					"pyright",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = vim.keymap
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Diagnostic signs
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
					},
					linehl = {
						[vim.diagnostic.severity.ERROR] = "Error",
						[vim.diagnostic.severity.WARN] = "Warn",
						[vim.diagnostic.severity.INFO] = "Info",
						[vim.diagnostic.severity.HINT] = "Hint",
					},
				},
			})

			-- LSP keymaps on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }
					keymap.set(
						"n",
						"<leader>cr",
						"<cmd>Telescope lsp_references<CR>",
						vim.tbl_extend("force", opts, { desc = "Show LSP references" })
					)
					keymap.set(
						"n",
						"<leader>cd",
						vim.lsp.buf.declaration,
						vim.tbl_extend("force", opts, { desc = "Go to declaration" })
					)
					keymap.set(
						"n",
						"<leader>ci",
						"<cmd>Telescope lsp_implementations<CR>",
						vim.tbl_extend("force", opts, { desc = "Show LSP implementations" })
					)
					keymap.set(
						"n",
						"<leader>ctd",
						"<cmd>Telescope lsp_type_definitions<CR>",
						vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" })
					)
					keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						vim.tbl_extend("force", opts, { desc = "See available code actions" })
					)
					keymap.set(
						"n",
						"<leader>rn",
						vim.lsp.buf.rename,
						vim.tbl_extend("force", opts, { desc = "Smart rename" })
					)
					keymap.set(
						"n",
						"<leader>D",
						"<cmd>Telescope diagnostics bufnr=0<CR>",
						vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" })
					)
					keymap.set(
						"n",
						"<leader>dl",
					  vim.diagnostic.open_float,
						vim.tbl_extend("force", opts, { desc = "Show line diagnostics" })
					)
					keymap.set(
						"n",
						"[d",
						vim.diagnostic.goto_prev,
						vim.tbl_extend("force", opts, { desc = "Go to previous diagnostic" })
					)
					keymap.set(
						"n",
						"]d",
						vim.diagnostic.goto_next,
						vim.tbl_extend("force", opts, { desc = "Go to next diagnostic" })
					)
					keymap.set(
						"n",
						"K",
						vim.lsp.buf.hover,
						vim.tbl_extend("force", opts, { desc = "Show documentation for what is under cursor" })
					)
					keymap.set(
						"n",
						"<leader>rs",
						":LspRestart<CR>",
						vim.tbl_extend("force", opts, { desc = "Restart LSP" })
					)
				end,
			})

			local servers = {
				"lua_ls",
				"ts_ls",
				"terraformls",
				"tflint",
				"jdtls",
				"omnisharp",
				"clangd",
				"html",
				"cssls",
				"emmet_ls",
				"pyright",
			}
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
