return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    -- Add :SessionSave and :SessionRestore commands (optional)
    vim.api.nvim_create_user_command("SessionSave", function()
      auto_session.SaveSession()
    end, {})

    vim.api.nvim_create_user_command("SessionRestore", function()
      auto_session.RestoreSession()
    end, {})

    -- Keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>ws", function()
      auto_session.SaveSession()
    end, { desc = "Save session" })

    keymap.set("n", "<leader>wr", function()
      auto_session.RestoreSession()
    end, { desc = "Restore session" })

    -- session-lens (optional)
    local ok, session_lens = pcall(require, "auto-session.session-lens")
    if ok then
      keymap.set("n", "<leader>wl", session_lens.search_session, {
        noremap = true,
        desc = "List all saved sessions"
      })
    end
  end,
  dependencies = {
    {
      "rmagatti/session-lens",
      dependencies = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("session-lens").setup({})
      end,
    }
  }
}
