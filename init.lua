vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set wildmenu")
vim.cmd("set history=200")
vim.cmd("set wildmode=full")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader= " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' 
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"nvim-tree/nvim-tree.lua"}
  }
}

require("lazy").setup(plugins, opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "python", "javascript"},
  highlight = { enable = true },
  indent = { enable = true }
})
--require catppuccin
require("catppuccin").setup()

--set the colorscheme to it!
vim.cmd.colorscheme "catppuccin"

require("nvim-tree").setup({
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
})

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader><space>', ':noh<CR>')
