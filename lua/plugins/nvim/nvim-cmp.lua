--[[
Auto complete.
]]

return {
  {
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = 'InsertEnter',
    dependencies = {
      'neovim/nvim-lspconfig',
      -- LSP completion source:
      'hrsh7th/cmp-nvim-lsp',
      -- Useful completion sources:
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      -- 'hrsh7th/cmp-path', -- slow
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = function()
      local cmp = require 'cmp'

      cmp.setup {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
          end,
        },
        sources = {
          { name = 'nvim_lsp', keyword_length = 3 }, -- from language server
          { name = 'nvim_lua', keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
          { name = 'vsnip', keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
          { name = 'nvim_lsp_signature_help' }, -- display function signatures with current parameter emphasized
          { name = 'buffer', keyword_length = 2 }, -- source current buffer
          -- { name = 'path' }, -- file paths; slow.
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          -- ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- todo: how it works?
          -- ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<Esc>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      }
    end,
  },
}
