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
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      local keymap = vim.keymap

      -- Diagnostics appearance
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
          },
        },
      })

      -- LSP Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          keymap.set("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references", unpack(opts) })
          keymap.set("n", "<leader>cd", vim.lsp.buf.declaration, { desc = "Go to declaration", unpack(opts) })
          keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations", unpack(opts) })
          keymap.set("n", "<leader>ctd", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions", unpack(opts) })
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", unpack(opts) })
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", unpack(opts) })
          keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show diagnostics", unpack(opts) })
          keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics", unpack(opts) })
          keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", unpack(opts) })
          keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", unpack(opts) })
          keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs", unpack(opts) })
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", unpack(opts) })
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
        if server == "terraformls" then
          vim.lsp.config(server, {
            capabilities = capabilities,
            settings = {
              ignoreSingleFileWarning = true,
            },
          })
        else
          vim.lsp.config(server, {
            capabilities = capabilities,
          })
        end

        vim.lsp.enable(server)
      end
    end,
  },
}
