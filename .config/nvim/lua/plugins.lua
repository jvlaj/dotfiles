return require('packer').startup(function()

        use {'wbthomason/packer.nvim', opt = true}

        -- LSP and completion
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/completion-nvim'
	use 'onsails/lspkind-nvim'

        -- fuzzy finder
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
              
        -- vim dispatch
        use 'tpope/vim-dispatch'
        
        -- git
        use 'tpope/vim-fugitive'
	use 'airblade/vim-gitgutter'
        use 'lewis6991/gitsigns.nvim'
              
        -- highlights
        use 'nvim-treesitter/nvim-treesitter'
              
        -- file explorer
        use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'
              
        -- colorschemes
        use 'chriskempson/base16-vim'
        use {'xolox/vim-colorscheme-switcher', requires = {'xolox/vim-misc'}}
              
        -- markdown & pdf
        use 'vim-pandoc/vim-pandoc'
        use 'vim-pandoc/vim-pandoc-syntax'
        use 'lingnand/pandoc-preview.vim'
        use 'ferrine/md-img-paste.vim'

	-- for writing 
	use 'reedes/vim-pencil'
	use 'preservim/vim-lexical'
	use 'preservim/vim-wordy'

	-- latex
	use 'vim-latex/vim-latex'
	use 'lervag/vimtex'

	-- undotree
	use 'mbbill/undotree'

	-- snippets
	use 'sirver/ultisnips'
	use 'honza/vim-snippets'

	-- vim-surround
	use 'tpope/vim-surround'

	-- easy motion
	use 'easymotion/vim-easymotion'

	-- lightline
	use 'itchyny/lightline.vim'

	-- sendtowindow
	use 'karoliskoncevicius/vim-sendtowindow'

	-- startify
	use 'mhinz/vim-startify'

	-- development
		-- lua dev
		use 'tjdevries/nlua.nvim'
		use 'euclidianAce/BetterLua.vim'

end)
