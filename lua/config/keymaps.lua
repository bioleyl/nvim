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

-- Function to disable autoformatting
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

-- Display unsaved buffers
vim.keymap.set('n', '<leader>um', function()
  local fzf_lua = require 'fzf-lua'

  -- Builds the list of modified buffers
  local function get_modified_buffers()
    local lines = {}
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modified and vim.bo[bufnr].buflisted and vim.api.nvim_buf_get_name(bufnr) ~= '' then
        local name = vim.api.nvim_buf_get_name(bufnr)
        table.insert(lines, string.format('[%d] %s', bufnr, name))
      end
    end
    return lines
  end

  -- Helper to extract bufnr from selected entry
  local function parse_bufnr(entry)
    return tonumber(entry:match '^%[(%d+)%]')
  end

  -- Encapsulated FZF launcher
  local function show_unsaved_buffers()
    fzf_lua.fzf_exec(get_modified_buffers(), {
      prompt = 'Unsaved Buffers> ',
      actions = {
        ['default'] = function(selected)
          local bufnr = parse_bufnr(selected[1])
          if bufnr then
            vim.api.nvim_set_current_buf(bufnr)
          end
        end,
        ['ctrl-w'] = function(selected)
          for _, entry in ipairs(selected) do
            local bufnr = parse_bufnr(entry)
            if bufnr and vim.bo[bufnr].modified then
              vim.api.nvim_buf_call(bufnr, function()
                vim.cmd 'write'
              end)
            end
          end
          -- Relaunch with updated buffer list
          vim.defer_fn(show_unsaved_buffers, 50)
        end,
      },
    })
  end

  -- Initial launch
  show_unsaved_buffers()
end, { desc = '[U]nsaved [M]odified Buffers' })
