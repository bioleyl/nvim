return {
  'rebelot/kanagawa.nvim',
  config = function()
    require('kanagawa').setup {
      transparent = true,
    }
    vim.cmd 'colorscheme kanagawa'
  end,
  build = function()
    vim.cmd 'KanagawaCompile'
  end,
}
