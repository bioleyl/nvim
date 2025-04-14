-- plugins/colorizer.lua
return {
  'norcalli/nvim-colorizer.lua',
  event = { 'BufReadPost', 'BufNewFile' }, -- lazy-load on file open
  config = function()
    require('colorizer').setup({
      '*', -- Enable for all filetypes
    }, {
      RGB = true, -- #RGB
      RRGGBB = true, -- #RRGGBB
      names = true, -- "blue"
      RRGGBBAA = true, -- #RRGGBBAA
      rgb_fn = true, -- rgb(0,0,0)
      hsl_fn = true, -- hsl(120,100%,50%)
      css = true, -- Enable all CSS features
      css_fn = true, -- Enable all CSS functions
    })
  end,
}
