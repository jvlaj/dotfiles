return require('packer').startup(function()

    -- packer
	use {'wbthomason/packer.nvim', opt = true}

    -- LSP and completion
	use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
	use 'onsails/lspkind-nvim'

    -- fuzzy finder
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

    -- statusbar, bufferline
	use {'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
	use 'akinsho/nvim-bufferline.lua'

    -- lua dev
    use 'tjdevries/nlua.nvim'
    use 'euclidianAce/BetterLua.vim'

    -- vim dispatch
    use 'tpope/vim-dispatch'

    -- fugitive for git
    use 'tpope/vim-fugitive'

    -- git history
	use 'lewis6991/gitsigns.nvim'

    -- programming highlights
	use 'nvim-treesitter/nvim-treesitter'

    -- file explorer
	use 'kyazdani42/nvim-tree.lua'

    -- colorschemes
	use 'chriskempson/base16-vim'

end)
