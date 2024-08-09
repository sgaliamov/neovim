local vsc = require 'vscode-neovim'
local opts = require('keymaps.utils').key_opts;
local map = vim.keymap.set

-- use standard binding for all modes
-- map(
--   { 'v', 'i', 'n' },
--   '<C-f>',
--   function() vsc.call 'actions.find' end,
--   opts('Find')
-- )

-- use standard binding for all modes
-- map(
--   { 'v', 'i', 'n' },
--   '<C-h>',
--   function() vsc.call 'editor.action.startFindReplaceAction' end,
--   opts('Replace')
-- )

-- map(
--   {'i', 'v'},
--   'rr',
--   function() vsc.call 'editor.action.rename' end,
--  opts('Refactring: Rename'))

-- map(
--   {'n', 'v'},
--   '<leader>w',
--   function() vsc.call 'editor.action.smartSelect.expand' end,
--   opts('Expand selection'))

-- map({'n', 'v'},
--   '<leader><S-w>',
--   function() vsc.call 'editor.action.smartSelect.shrink' end,
--   opts('Schirnk selection'))
