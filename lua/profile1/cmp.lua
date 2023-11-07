-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- [[ KEYMAPS ]]

    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },

    sources = {
        { name = 'nvim_lsp', keyword_length = 1, max_item_count = 12 },
        { name = 'luasnip',  keyword_length = 3, max_item_count = 3 },
        { name = 'path',     keyword_length = 3 },
        { name = "buffer",   keyword_length = 4, max_item_count = 3 },
    },

    experimental = {
        ghost_text = true,
    }
}

-- [[ KEYMAPS ]]
-- Add keymaps for quick navigation in snippets.

-- next
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if luasnip.jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })

-- previous
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

-- change choice when there is a choice
vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, { silent = true })
