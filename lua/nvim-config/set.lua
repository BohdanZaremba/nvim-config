vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ic = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.number = true
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.list = false
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- vim.opt.list needs to be true for this
vim.opt.guicursor = "i-c:ver1-blinkon500-blinkoff500,r:block-blinkon500-blinkoff500,n:block-blinkon0"


vim.opt_global.shortmess:remove("F")
vim.g.have_nerd_font = true
vim.opt.showmode = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.guifont = '0xProto Nerd Font'
