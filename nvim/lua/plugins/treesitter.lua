return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
		    ensure_installed = {"lua","javascript", "c", "helm", "html","markdown", "markdown_inline", "typescript", "vim", "terraform", "toml", "sql" , "java", "python", "c_sharp", "csv", "json", "yaml", "javadoc" },
      })
    end
  }
}
