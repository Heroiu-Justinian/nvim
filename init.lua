require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.syntaxtree"
require "user.telescope"
require "user.treesitter"
require "user.spectre"
require "user.autopairs"
require "user.comments"
require "user.nvimtree"
require "user.lualine"
require "user.toggleterm"
require "impatient" -- didn't bother to make a configfile for this one
require "user.bufferline"
require "user.prettier"

--Again, cannot bother to make another file just for this
require("scrollbar").setup()
require("nvim-surround").setup()
