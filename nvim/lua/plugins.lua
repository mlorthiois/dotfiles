-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- General
    use 'liuchengxu/vim-which-key'
    use 'airblade/vim-rooter'
    use 'ChristianChiarulli/dashboard-nvim'
    use 'akinsho/nvim-toggleterm.lua'
    use "terrortylor/nvim-comment"
    use "phaazon/hop.nvim" --Replace vim-sneak
    use 'nightsense/night-and-day'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'mfussenegger/nvim-jdtls'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'lewis6991/gitsigns.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status Line and Tab line
    use {'glepnir/galaxyline.nvim', branch = 'main'}
    use 'romgrk/barbar.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Color
    use 'norcalli/nvim-colorizer.lua'
end)
