local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  vim.cmd('colorscheme rose-pine')

  use 'hrsh7th/nvim-cmp'

    -- nvim-cmp sources
  use 'hrsh7th/cmp-nvim-lsp'          -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'            -- Buffer source for nvim-cmp
  use 'hrsh7th/cmp-path'              -- Path source for nvim-cmp
  use 'hrsh7th/cmp-cmdline'           -- Command-line source for nvim-cmp

  -- (Optional) Snippet support
  use 'L3MON4D3/LuaSnip'              -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'      -- Snippet source for nvim-cmp

  use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
	"mfussenegger/nvim-lint",
	"rshkarin/mason-nvim-lint",
        'neovim/nvim-lspconfig' -- Required to configure the LSP servers
    }

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


