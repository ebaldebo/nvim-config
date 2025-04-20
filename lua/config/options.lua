vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount of indentation with << >>
vim.opt.tabstop = 4 -- Spaces per tab
vim.opt.softtabstop = 4 -- Spaces applied when pressing tab

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keep indentation from previous line
vim.opt.breakindent = true -- Enable break indent

vim.opt.number = true -- Line numbers

vim.opt.cursorline = true

-- Store undos between sessions
vim.opt.undofile = true

-- Enable mousemode for resizing splits
vim.opt.mouse = "a"

-- Dont show the mode, already in status line
vim.opt.showmode = false

vim.opt.ignorecase = true -- Ignore case when searching unless \C
vim.opt.smartcase = true -- If writing upper case, case sensitive

vim.opt.signcolumn = "yes"

-- Configure how splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Invisible char behavior
-- See :help list
-- and :help listchars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.scrolloff = 10 -- Minimum lines above and below
