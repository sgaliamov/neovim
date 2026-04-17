local opt = vim.opt

vim.wo.number = true
vim.wo.relativenumber = true

-- Edit:
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- UI:
opt.cursorline = true -- highlight the current cursor line.
opt.signcolumn = 'yes:1' -- to give space for warning signs.
-- vim.opt.termguicolors = true -- Nvim will automatically attempt to determine if the host terminal supports 24-bit color and will enable this option if it does
opt.list = true -- Displays invisible characters.
opt.listchars:append {
  trail = '·',
  tab = '┠─',
}

-- Search settings:
opt.ignorecase = true -- ignore case when searching.
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive.

-- Other:
opt.swapfile = false -- turn off swapfile
