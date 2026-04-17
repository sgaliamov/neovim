-- Registers popup.
-- does not work in vscode

return {
  'tversteeg/registers.nvim',
  cmd = 'Registers',
  config = true,
  keys = {
    { '"',    mode = { 'n', 'v' } },
    { '<C-R>', mode = 'i' }
  },
  name = 'registers',
}
