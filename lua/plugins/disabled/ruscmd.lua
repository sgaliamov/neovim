-- doesn't work in vscode
-- and causing weerd behaviour for "," and "."

return {
  'aveplen/ruscmd.nvim',
  event = 'VeryLazy', -- to definitely load in vscode
  opts = {},
}
