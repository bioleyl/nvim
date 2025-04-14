local opts = { noremap = true, silent = true }

-- Copy to clipboard
vim.keymap.set({ 'n', 'v' }, 'y', '"+y', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, 'Y', '"+Y', { noremap = true, silent = true })

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Display code diagnostic
vim.keymap.set('n', 'gl', function()
  vim.diagnostic.open_float()
end, { desc = 'Open Diagnostic in Float' })

-- Display code information
vim.keymap.set('n', '<C-Space>', function()
  vim.lsp.buf.hover()
end, { desc = 'Open lsp info' })
