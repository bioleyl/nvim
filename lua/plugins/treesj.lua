return {
  'Wansmer/treesj',
  keys = {
    {
      '<leader>m',
      '<CMD>TSJToggle<CR>',
      desc = 'Toggle Join/Unjoin',
    },
  },
  cmd = { 'TSJToggle', 'TSJJoin', 'TSJSplit' },
  opts = { use_default_keymaps = false },
}
