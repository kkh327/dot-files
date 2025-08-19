return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
    vim.keymap.set('n', '<C-t>', '<Cmd>Neotree toggle<CR>')
    vim.keymap.set('n', '<C-a>n', ':bnext<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-a>p', ':bprev<CR>', { noremap = true, silent = true })
	end,
}
