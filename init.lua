vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set gdefault")
vim.cmd("set incsearch")
vim.cmd("set showmatch")
vim.cmd("set hlsearch")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set wildmenu")
vim.cmd("set nocompatible")
vim.cmd("set modelines=0")
vim.cmd("set history=200")
vim.cmd("set wildmode=full")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set wrap")
vim.cmd("set textwidth=79")
vim.cmd("set formatoptions=qrn1")
vim.cmd("set colorcolumn=85")
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
vim.keymap.set('n', '<C-p>', builtin.find_files, {noremap = true})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {noremap = true})

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

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>',{noremap = true})
vim.keymap.set('n', '<leader><space>', ':noh<CR>',{noremap = true})
vim.keymap.set('n', '<tab>', '%',{noremap = true})
vim.keymap.set('v', '<tab>', '%',{noremap = true})
vim.keymap.set('n', '<up>', '<nop>' ,{noremap = true})
vim.keymap.set('n', '<down>', '<nop>' ,{noremap = true})
vim.keymap.set('n', '<left>', '<nop>' ,{noremap = true})
vim.keymap.set('n', '<right>', '<nop>' ,{noremap = true})
vim.keymap.set('i', '<up>', '<nop>' ,{noremap = true})
vim.keymap.set('i', '<down>', '<nop>' ,{noremap = true})
vim.keymap.set('i', '<left>', '<nop>' ,{noremap = true})
vim.keymap.set('i', '<right>', '<nop>' ,{noremap = true})
--vim.keymap.set('n', 'j', 'gj' ,{noremap = true})
--vim.keymap.set('n', 'k', 'gk' ,{noremap = true})
vim.keymap.set('n', 'jk', '<ESC>' ,{noremap = true})
vim.keymap.set('n', '<leader>w', '<C-w>v<C-w>l' ,{noremap = true})
vim.keymap.set('n', '<C-h>', '<C-w>h' ,{noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j' ,{noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k' ,{noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l' ,{noremap = true})
