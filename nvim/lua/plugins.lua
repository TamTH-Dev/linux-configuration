-- Ensure that packer.nvim is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Colorscheme
  use { 'gruvbox-community/gruvbox' }
  use { 'ghifarit53/tokyonight-vim' }

  -- Customized status line
  use { 'vim-airline/vim-airline' }
  use { 'vim-airline/vim-airline-themes' }

	-- Parser
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'nvim-treesitter/playground' }

  -- Symbols outline
	use { 'simrat39/symbols-outline.nvim' }

	-- Icons
	use { 'kyazdani42/nvim-web-devicons' }

	-- Git wrapper
	use { 'tpope/vim-fugitive' }

	-- Multiple cursors
	use { 'terryma/vim-multiple-cursors' }

	-- Commenter
	use { 'tpope/vim-commentary' }

	-- Support auto close
	use { 'cohama/lexima.vim' }

	-- Auto close (X)HTML tags
	use { 'alvan/vim-closetag' }

	-- Surround parentheses, brackets, quotes, XML tags, and more
	use { 'tpope/vim-surround' }

	-- Emmet
	use { 'mattn/emmet-vim' }

	-- File explorer
	use { 'kevinhwang91/rnvimr' }

	-- Fuzzy search
	use { 'nvim-telescope/telescope.nvim' }
	use { 'nvim-lua/plenary.nvim' }

	-- Formatter
	use { 'sbdchd/neoformat' }

	-- LSP supporter
	use { 'neovim/nvim-lspconfig' }
	use { 'glepnir/lspsaga.nvim' }
	use { 
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/vim-vsnip' },
			{ 'hrsh7th/vim-vsnip-integ' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-path', after = 'nvim-cmp' }
    }
  }
end)
