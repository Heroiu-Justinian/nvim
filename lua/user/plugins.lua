local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  
  -- My config loads before the monitor has time to refresh
  use 'lewis6991/impatient.nvim'

 -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Git integration
  use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    end
  }

  -- devicons cause we feeling fancy atm
  use 'nvim-tree/nvim-web-devicons'

  -- Colorschemes
  --use "christianchiarulli/nvcode-color-schemes.vim"
   use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  --use "lunarvim/darkplus.nvim"
  -- use {
  --      'mastertinner/nvim-quantum',
    --    config = function() require('quantum').setup() end,
    --}

   use "glepnir/dashboard-nvim"


  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  -- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'} -- spicy completion here

  -- HTML completions and stuff
  use "mattn/emmet-vim"

  --Because I can't stand the way my html and css look, I will include prettify
  use "jose-elias-alvarez/null-ls.nvim"
  -- use "averms/black-nvim"
  use "MunifTanjim/prettier.nvim"

  --formatter
  use "mhartington/formatter.nvim"

  -- Debugging with DAP

  --autopairs
  use "windwp/nvim-autopairs"
 --and the antagonist, surround ( gotta delete them brackets somethow )
  use "https://github.com/kylechui/nvim-surround"
  -- automated commenting
  use "numToStr/Comment.nvim" 
  use "JoosepAlviste/nvim-ts-context-commentstring" -- context-dependent commenting; useful for frameworks 

  --multicursor
  use "mg979/vim-visual-multi"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim" -- media support
  use  "nvim-telescope/telescope-file-browser.nvim" -- file browsing for the win
  -- File explorer
  use "nvim-tree/nvim-tree.lua"

  -- Toggleterm
  use "akinsho/toggleterm.nvim"

  --git scrollbar
  use "https://github.com/petertriho/nvim-scrollbar"

  --Bufferline
  use "akinsho/bufferline.nvim"

  -- Lualine
  use "nvim-lualine/lualine.nvim"
  -- use "vim-lua/lsp-status.nvim"
  --find and replace using the spectral forbidden powershell
  use "windwp/nvim-spectre"


 -- Treesitter
 use {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate"
 }
 use "nvim-treesitter/playground"

  -- abstract syntax tree
  use 'simrat39/symbols-outline.nvim'

  -- Training to git gud
  use "ThePrimeagen/vim-be-good"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
