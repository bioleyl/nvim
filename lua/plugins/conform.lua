return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform will run multiple formatters sequentially
      python = { 'isort', 'black' },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { 'rustfmt', lsp_format = 'fallback' },
      -- Conform will run the first available formatter
      typescriptreact = { 'eslint_custom', 'prettierd', stop_after_first = true },
      javascriptreact = { 'eslint_custom', 'prettierd', stop_after_first = true },
      javascript = { 'eslint_custom', 'prettierd', stop_after_first = true },
      typescript = { 'eslint_custom', 'prettierd', stop_after_first = true },
      html = { 'prettierd', stop_after_first = true },
      json = { 'prettierd', stop_after_first = true },
    },
    formatters = {
      -- This formatter uses eslint_d only if ESLint config exists
      eslint_custom = {
        inherit = false,
        async = true,
        condition = function(ctx)
          -- Search upward from the buffer's directory for an ESLint config
          local eslint_config = vim.fs.find({
            '.eslintrc',
            '.eslintrc.js',
            '.eslintrc.cjs',
            '.eslintrc.json',
            '.eslintrc.yml',
            'eslint.config.js',
            'eslint.config.mjs',
          }, {
            path = ctx.filename and vim.fs.dirname(ctx.filename) or ctx.root,
            upward = true, -- This is important for nested projects
          })

          return #eslint_config > 0
        end,

        command = 'eslint_d',
        args = { '--fix-to-stdout', '--stdin', '--stdin-filename', '$FILENAME' },
      },

      -- Prettier formatter
      prettierd = {
        command = 'prettierd',
        args = { '$FILENAME' },
      },
    },
  },
}
