--[[ local vin = { 'v', 'i', 'n' }

local function toogle_language()
  local current = vim.api.nvim_exec('set keymap?', true)
  local ru = '  keymap=russian-jcukenwin'

  if current == ru then
    vim.notify 'En'
    vim.api.nvim_command 'set keymap='
  else
    vim.notify 'Ru'
    vim.api.nvim_command 'set keymap=russian-jcukenwin'
  end
end

require('keymaps.utils').map_keys {
  { '<leader>L', ':Lazy<cr>', 'Lazy UI' },
}

require('keymaps.utils').map_keys {
  { '<Esc>', ':noh<cr><Esc>', 'Cancel search highlighting with ESC' },
  { '<leader><leader>', '<nop>', 'Diable Space in nomal, visual and options modes' },

  -- Better yanking.
  { 'x', '"_x', 'Remove without yanking', m = 'n' },
  { 'p', '"_dP', 'Replace without yanking', m = 'v' }, -- use <Shift-Insert> to paste from clipboard.
  { '<leader>c', '"_ciw', 'Change inner word without yanking', m = 'n' },
  { '<leader>d', '"_diw', 'Delete inner word without yanking' },
  { '<leader>x', 'ciw', 'Cut inner word' },
  { '<leader>y', '"+y', 'Yank in clipboard' },
  { '<leader>C', '"_ct', 'Change without yanking', m = 'n' },
  { '<leader>D', '"_dt', 'Delete without yanking' },
  { '<leader>Y', '"+Y', 'Yank line in clipboard' },
  { '<leader>s', ':w', 'Save file' },

  -- Surrounding
  { 's', '<nop>', 'Surround...', m = { 'v', 'n' } },
  { 'sd', '<nop>', 'Delete surrounding...', m = { 'v', 'n' } },

  -- Surround inner word
  { "s'", "ciw'<C-r>\"'<Esc>", "Surround with ''", m = 'n' },
  { 's"', 'ciw"<C-r>""<Esc>', 'Surround with ""', m = 'n' },
  { 's`', 'ciw`<C-r>"`<Esc>', 'Surround with ``', m = 'n' },
  { 's,', 'ciw<<C-r>"><Esc>', 'Surround with <>', m = 'n' },
  { 's8', 'ciw(<C-r>")<Esc>', 'Surround with ()', m = 'n' },
  { 's[', 'ciw[<C-r>"]<Esc>', 'Surround with []', m = 'n' },
  { 's{', 'ciw{<C-r>"}<Esc>', 'Surround with {}', m = 'n' },

  -- Surround visually selected text
  { "s'", "c'<C-r>\"'<Esc>", "Surround with ''", m = 'v' },
  { 's"', 'c"<C-r>""<Esc>', 'Surround with ""', m = 'v' },
  { 's`', "c'<C-r>`'<Esc>", 'Surround with ``', m = 'v' },
  { 's,', 'c<<C-r>"><Esc>', 'Surround with <>', m = 'v' },
  { 's8', 'c(<C-r>")<Esc>', 'Surround with ()', m = 'v' },
  { 's[', 'c[<C-r>"]<Esc>', 'Surround with []', m = 'v' },
  { 's{', 'c{<C-r>"}<Esc>', 'Surround with {}', m = 'v' },

  -- Delete surrounding
  { "sd'", 'di\'h"_1s<C-r>"<Esc>', m = 'n' },
  { 'sd"', 'di"h"_1s<C-r>"<Esc>', m = 'n' },
  { 'sd`', 'di`h"_1s<C-r>`<Esc>', m = 'n' },
  { 'sd,', 'di<h"_1s<C-r>"<Esc>', m = 'n' },
  { 'sd8', 'di(h"_2s<C-r>"<Esc>', m = 'n' },
  { 'sd[', 'di[h"_1s<C-r>"<Esc>', m = 'n' },
  { 'sd{', 'di{h"_1s<C-r>"<Esc>', m = 'n' },

  -- Change surrounding
  { '\'"', 'di\'h"_1s"<C-r>""<Esc>', m = 'n' },
  { '"\'', 'di"h"_1s\'<C-r>"\'<Esc>', m = 'n' },
}

-- To be albe to use a shortcut in the insert mode use A[lt].
require('keymaps.utils').map_keys {
  -- Save and quit.
  { '<C-q>', '<cmd>q<cr>', 'Close window', m = vin },
  { '<A-q>', '<cmd>qa<cr>', 'Close all windows', m = vin },
  { '<C-s>', '<cmd>w<cr>', 'Save file', m = vin },
  { '<A-s>', '<cmd>wa<cr>', 'Save all', m = vin },

  -- General.
  { 'jj', '<Esc>', 'Fast excape', m = 'i', remap = true },
  { '<C-A-l>', toogle_language, 'Toggle keyboard layout', m = vin },
  -- { '<Leader>h', ':%s/\\<<C-r><C-w>\\>//g<Left><Left><CR>', 'Replase word' },

  -- Move to window.
  { '<C-h>', '<C-w>h', 'Go to left window' },
  { '<C-j>', '<C-w>j', 'Go to lower window' },
  { '<C-k>', '<C-w>k', 'Go to upper window' },
  { '<C-l>', '<C-w>l', 'Go to right window', force = true }, -- default: redraws and clears the screen
  { '<C-Left>', '<C-w>h', 'Go to left window' },
  { '<C-Down>', '<C-w>j', 'Go to lower window' },
  { '<C-Up>', '<C-w>k', 'Go to upper window' },
  { '<C-Right>', '<C-w>l', 'Go to right window' },

  -- Better pagination (does not work in vscode).
  { '<C-d>', '<C-d>zz', 'Scroll half page down & center' },
  { '<C-u>', '<C-u>zz', 'Scroll half page up & center' },
  { '<C-f>', '<C-f>zz', 'Scroll page down & center' },
  { '<C-b>', '<C-b>zz', 'Scroll page up & center' },

  -- Navigation (does not work in vscode).
  { '<C-h>', '<Left>', 'Left in insert mode', m = 'i' }, -- default: backspace.
  { '<C-l>', '<Right>', 'Right in insert mode', m = 'i' }, -- default: prints .
  { '<C-k>', '<Up>', 'Left in insert mode', m = 'i' }, -- default: digraphs ø.
  { '<C-j>', '<Down>', 'Down in insert mode', m = 'i' }, -- default: new line.
}
 ]]
