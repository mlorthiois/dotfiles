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
    use "terrortylor/nvim-comment"
    use "phaazon/hop.nvim" --Replace vim-sneak
    use {"windwp/nvim-autopairs", opt = true}
    use 'Th3Whit3Wolf/Dusk-til-Dawn.nvim' -- Dark and night colorscheme

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'lewis6991/gitsigns.nvim'
    use 'simrat39/rust-tools.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'lukas-reineke/indent-blankline.nvim'}

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Status Line and Tab line
    use {'glepnir/galaxyline.nvim', branch = 'main'}
    use 'romgrk/barbar.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Color
    use 'norcalli/nvim-colorizer.lua'
end)
