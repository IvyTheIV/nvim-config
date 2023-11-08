-- [[ KEYMAPS ]]

-- keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- copy to/from system clipboard
vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y', { noremap = true })
vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p', { noremap = true })
vim.keymap.set({ 'v', 'n' }, '<leader>P', '"+P', { noremap = true })
vim.keymap.set('n', '<leader>Y', '"+yg_', { noremap = true })

-- toggle line highlight
vim.keymap.set('n', "<leader>lh", "<cmd>set invcul<CR>", { noremap = true })
-- toggle search highlight
vim.keymap.set('n', "<leader>sh", "<cmd>set invhlsearch<CR>", { noremap = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- useless stuff
vim.keymap.set('n', '<M-r>', "<cmd>CellularAutomaton make_it_rain<CR>", { noremap = true, desc = 'Make it rain' })
vim.keymap.set('n', '<M-s>', "<cmd>CellularAutomaton scramble<CR>", { noremap = true, desc = 'Scramble text' })
vim.keymap.set('n', '<M-l>', "<cmd>CellularAutomaton game_of_life<CR>", { noremap = true, desc = 'Game of life, why' })
