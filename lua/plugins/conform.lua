return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      -- These options will be passed to conform.format()
      lsp_format = 'fallback',
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform will run multiple formatters sequentially
      python = { 'isort', 'black' },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { 'rustfmt', lsp_format = 'fallback' },
      -- Conform will run the first available formatter
      typescriptreact = { 'eslint', 'prettierd', stop_after_first = true },
      javascriptreact = { 'eslint', 'prettierd', stop_after_first = true },
      javascript = { 'eslint', 'prettierd', stop_after_first = true },
      typescript = { 'eslint', 'prettierd', stop_after_first = true },
      html = { 'prettierd', stop_after_first = true },
      json = { 'prettierd', stop_after_first = true },
    },
    formatters = {
      -- This formatter uses eslint_d only if ESLint config exists
      eslint = {
        inherit = false,
        async = true,
        condition = function(ctx)
          -- Check if there's any ESLint config in the project
          local eslint_config = vim.fs.find({
            '.eslintrc',
            '.eslintrc.js',
            '.eslintrc.cjs',
            '.eslintrc.json',
            'eslint.config.js',
            'eslint.config.mjs',
          }, { path = ctx.root, upward = false })

          -- Return true if ESLint config files are found, otherwise false
          return #eslint_config > 0
        end,

        -- Command and args for eslint_d
        command = 'eslint_d',
        args = { '--fix-to-stdout', '--stdin', '--stdin-filename', '$FILENAME' },

        -- Fallback formatter if ESLint config is not found
        fallback_formatter = 'prettierd',
      },

      -- Prettier formatter
      prettierd = {
        command = 'prettierd',
        args = { '$FILENAME' },
      },
    },
  },
}
