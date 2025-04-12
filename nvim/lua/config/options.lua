vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.terminal_direction = "float"

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.undofile = true
vim.opt.confirm = true

vim.opt.shell = "/usr/bin/zsh"
