return {
  'echasnovski/mini.nvim',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    if vim.g.vscode then
      -- todo: make a configuration file to define which mini plugings to load.
    else
      -- auto closing paranthesis.
      require('mini.pairs').setup {
        mappings = {
          ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
        },
      }
      require('mini.move').setup()
    end
  end,
}
