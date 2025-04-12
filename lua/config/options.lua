-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.undofile = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '_' }

vim.opt.scrolloff = 10

-- Format with eslint_d or prettierd when saving
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = { '*.ts', '*.js', '*.jsx', '*.tsx' },
--   callback = function()
--     -- Get the absolute file path
--     local file_path = vim.fn.expand '%:p'
--
--     -- Check if there is an ESLint configuration file
--     local eslintrc = vim.fn.glob '.eslintrc.*'
--     if eslintrc ~= '' then
--       print 'eslint'
--       -- If ESLint configuration is found, use eslint_d for formatting
--       vim.fn.system('eslint_d --fix ' .. file_path) -- Run eslint_d
--       -- vim.cmd 'edit!' -- Revert any changes made by eslint_d
--     else
--       print 'prettier'
--       -- If no ESLint configuration, use prettierd for formatting
--       vim.fn.system('prettierd --write ' .. file_path) -- Run prettierd
--       -- vim.cmd 'edit!' -- Revert any changes made by prettierd
--     end
--   end,
-- })
