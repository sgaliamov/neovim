-- Fancy notifications.

return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  opts = {
    render = 'compact',
    stages = 'static',
  },
  keys = {
    { '<leader>tn', ':Telescope notify<cr>', desc = 'Notification history' },
  },
}
