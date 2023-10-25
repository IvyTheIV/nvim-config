--  NOTE: Order is important.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('profile1.packages')
require('profile1.settings')
require('profile1.keymaps')
require("profile1.telescope")
require('profile1.treesitter')
require('profile1.lsp')
require('profile1.mason')
require('profile1.cmp')
