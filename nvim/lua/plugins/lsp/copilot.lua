return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_enabled = false
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
}

-- Dynamic setup 
-- suggestion = {
  -- enabled = not vim.g.ai_cmp,            -- Enable suggestions only if `vim.g.ai_cmp` is false or nil.
  -- auto_trigger = true,                   -- Automatically trigger suggestions as you type.
--   -- hide_during_completion = vim.g.ai_cmp,-- Hide Copilot suggestions during nvim-cmp completion if `vim.g.ai_cmp` is true.
--   keymap = {
--     accept = false,                      -- Disable Copilot's own accept key because completion is handled by nvim-cmp or blink.cmp.
--     next = "<M-]>",                     -- Map Alt + ] to go to next suggestion.
--     prev = "<M-[>",                     -- Map Alt + [ to go to previous suggestion.
--   },
-- },
-- panel = { enabled = false },             -- Disable the Copilot panel UI.
-- filetypes = {
--   markdown = true,                       -- Enable Copilot suggestions for markdown files.
--   help = true,                           -- Enable Copilot suggestions for help files.
-- },
--
