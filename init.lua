require 'config.lazy'

if vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
  -- Windows-specific configuration
  vim.o.shell = 'powershell.exe'
  vim.o.shellcmdflag = '-Command'
  vim.o.shellquote = "'" -- PowerShell uses single quotes for strings with spaces
  vim.o.shellxquote = '' -- Disable extra quoting
elseif vim.fn.has 'unix' == 1 then
  -- Linux-specific configuration
  vim.o.shell = '/bin/bash'
  vim.o.shellcmdflag = '-c'
  vim.o.shellquote = '"'
  vim.o.shellxquote = '' -- Disable extra quoting
else
  -- Fallback for other platforms (e.g., macOS or unrecognized systems)
  vim.o.shell = '/bin/bash'
  vim.o.shellcmdflag = '-c'
  vim.o.shellquote = '"'
  vim.o.shellxquote = '' -- Disable extra quoting
end
