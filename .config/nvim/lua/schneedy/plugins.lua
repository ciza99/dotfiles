local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- common utils
	use("nvim-lua/plenary.nvim")

	-- theme
	use("olivercederborg/poimandres.nvim")

	-- handy stuff
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("christoomey/vim-tmux-navigator")

	-- comment
	use("numToStr/Comment.nvim")

	-- better icons
	use("kyazdani42/nvim-web-devicons")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use("nvim-telescope/telescope-file-browser.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- lsp server manager
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("onsails/lspkind.nvim")

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- highlighting and context
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("nvim-treesitter/nvim-treesitter-context")

	-- brackets and tags automatic closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- tabs
	use("akinsho/nvim-bufferline.lua")

	-- git
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
