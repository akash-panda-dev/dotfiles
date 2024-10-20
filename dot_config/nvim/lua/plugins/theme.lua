return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000, -- Load before all other start plugins
  config = function()
    -- Set options before applying the colorscheme
    require('gruvbox').setup {
      contrast = 'hard',
      -- You can add more Gruvbox-specific configurations here if needed
    }
    vim.o.background = 'dark' -- or "light" for light mode
    vim.cmd [[colorscheme gruvbox]]
  end,
}
