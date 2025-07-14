local indent_size = 4

-- Basic options
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight the current line
vim.opt.wrap = false -- Disable line wrapping
vim.opt.scrolloff = 10 -- Minimum lines above and below
vim.opt.sidescrolloff = 8 -- Minimum columns left and right

-- Indentation options
vim.opt.tabstop = indent_size -- Spaces per tab
vim.opt.shiftwidth = indent_size -- Amount of indentation with << >>
vim.opt.softtabstop = indent_size -- Spaces applied when pressing tab
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smarttab = true -- Smart tab behavior
vim.opt.smartindent = true -- Smart indentation for new lines
vim.opt.autoindent = true -- Keep indentation from previous line
vim.opt.breakindent = true -- Enable break indent

-- Search options
vim.opt.ignorecase = true -- Ignore case when searching unless \C
vim.opt.smartcase = true -- If writing upper case, case sensitive
vim.opt.hlsearch = false -- Disable highlighting search results
vim.opt.incsearch = true -- Incremental search

-- Visual options
vim.opt.termguicolors = true -- Enable 24-bit RGB colors in the terminal
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- Time to highlight matching brackets in tenths of a second
vim.opt.cmdheight = 2 -- Height of the command line
vim.opt.showmode = false -- Don't show the mode in the command line, already in status line
vim.opt.pumheight = 10 -- Height of the popup menu
vim.opt.pumblend = 10 -- Transparency of the popup menu
vim.opt.winblend = 0 -- Transparency of the window
vim.opt.conceallevel = 0 -- Don't conceal text
vim.opt.concealcursor = "" -- Don't conceal text in the cursor line
vim.opt.lazyredraw = true -- Don't redraw while executing macros or commands
vim.opt.synmaxcol = 300 -- Maximum number of columns to syntax highlight
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- Characters to use for listchars
vim.opt.list = true -- Show invisible characters like tabs and trailing spaces

-- File options
vim.opt.backup = false -- Disable backup files
vim.opt.writebackup = false -- Disable writing backup files
vim.opt.swapfile = false -- Disable swap files
vim.opt.undofile = true -- Enable persistent undo files
vim.opt.updatetime = 300 -- Time to update
vim.opt.timeoutlen = 500 -- Time to wait for a mapped sequence to complete
vim.opt.ttimeoutlen = 0 -- Time to wait for a key code sequence to complete
vim.opt.autoread = true -- Automatically read files changed outside of neovim
vim.opt.autowrite = true -- Automatically write files before running commands

-- Behavior options
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.errorbells = false -- Disable error bells
vim.opt.backspace = "indent,eol,start" -- Backspace behavior
vim.opt.mouse = "a" -- Enable mouse support in all modes
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard for all yank, delete, change and put operations
vim.opt.encoding = "UTF-8" -- Use UTF-8 encoding
vim.opt.modifiable = true -- Allow modifying buffers

-- Split options
vim.opt.splitright = true
vim.opt.splitbelow = true
