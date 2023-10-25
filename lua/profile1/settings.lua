vim.o.hlsearch = false                  -- set highlight on search
vim.wo.number = true                    -- make line numbers default
vim.wo.relativenumber = true            -- make the numbers relative to cursor
vim.o.mouse = 'a'                       -- enable mouse mode
vim.o.breakindent = true                -- enable break indent
vim.o.undofile = true                   -- save undo history

-- Case-insensitive searching UNLESS \C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'               -- keep signcolumn on by default
vim.wo.colorcolumn = "80"               -- line at column 80
vim.o.updatetime = 250                  -- decrease update time
-- vim.o.timeoutlen = 1000
vim.o.completeopt = 'menuone,noselect'  -- better completion experience
vim.o.termguicolors = true              -- enables 24 bit RGB colors.

-- Tab width
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true                  -- change tabs to spaces
vim.o.scrolloff = 8                     -- number of lines before scrolling

-- netrw settings
vim.g.netrw_banner = 0                  -- disable banner
vim.g.netrw_liststyle = 3               -- display files in a tree
-- settigns specific to netrw buffer
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"

-- kanagawa color scheme <3
vim.cmd("colorscheme kanagawa-wave");
vim.lsp.set_log_level("ERROR")
