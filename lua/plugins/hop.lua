-- Smart navigation.

local vinc = { '!', 'n', 'v' }
local vn = { 'v', 'n' }

return {
  'phaazon/hop.nvim',
  event = 'VeryLazy', -- to definitely load in vscode
  opts = {},
  keys = {
    { 'W', ':HopWord<cr>', mode = vinc, desc = 'Hop to word after the cursor' }
  },
}
