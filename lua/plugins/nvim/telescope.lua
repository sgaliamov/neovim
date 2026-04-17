-- Files searcher.

return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'smartpde/telescope-recent-files',
    'nvim-telescope/telescope-ui-select.nvim',
    'debugloop/telescope-undo.nvim',
  },
  config = function()
    local opts = {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {},
        },
        undo = {},
      },
    }

    require('telescope').setup(opts)
    require('telescope').load_extension 'ui-select'
    require('telescope').load_extension 'undo'
  end,
  keys = {
    {
      '<leader>u',
      '<cmd>Telescope undo<cr>',
      desc = 'Undo history',
    },
    {
      '<leader>fr',
      '<cmd>lua require("telescope").extensions.recent_files.pick()<cr>',
      desc = 'Recent files',
    },
    {
      '<leader>F',
      '<cmd>Telescope live_grep <cr>',
      desc = 'Grep',
    },
    {
      '<leader>fg',
      '<cmd>lua require("telescope.builtin").git_files()<cr>',
      desc = 'Git files',
    },
    {
      '<leader>ff',
      '<cmd>lua require("telescope.builtin").find_files()<cr>',
      desc = 'Find files',
    },
  },
}
