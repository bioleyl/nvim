return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { 'echasnovski/mini.icons' },
  opts = {},
  keys = {
    {
      '<leader>ff',
      function()
        local fzf = require 'fzf-lua'
        local is_git = vim.fn.system('git rev-parse --is-inside-work-tree'):match 'true'

        if is_git then
          fzf.git_files { show_untracked = true }
        else
          fzf.files {}
        end
      end,
      desc = '[F]ind [F]ile',
    },
    {
      '<leader>fg',
      function()
        local fzf = require 'fzf-lua'
        local is_git = vim.fn.system('git rev-parse --is-inside-work-tree'):match 'true'

        if is_git then
          fzf.grep {
            search = '',
            cmd = 'rg --files | xargs rg --color=always --line-number --column --smart-case',
            prompt = 'Grep (git files)> ',
          }
        else
          fzf.live_grep {
            rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden -g '!node_modules/**'",
            prompt = 'Grep (all files)> ',
          }
        end
      end,
      desc = '[F]ind by [G]rep',
    },
    {
      '<leader>fc',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind in neovim [C]onfig',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').builtin()
      end,
      desc = '[F]ind in [B]uiltin FZF',
    },
    {
      '<leader>fk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = '[F]ind in [K]eymaps',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[F]ind [R]esume',
    },
    {
      '<leader><leader>',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').lgrep_curbuf()
      end,
      desc = '[/] Livre grep the current buffer',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = '[F]ind current [W]ord',
    },
    {
      '<leader>fW',
      function()
        require('fzf-lua').grep_cWORD()
      end,
      desc = '[F]ind current [W]ORD',
    },
  },
}
