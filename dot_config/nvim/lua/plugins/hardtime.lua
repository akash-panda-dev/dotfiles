return {
  'm4xshen/hardtime.nvim',
  -- dir = '/Users/akashpanda/Documents/PandaWS/hardtime.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim', 'rcarriga/nvim-notify' },
  event = 'BufReadPost',
  opts = {
    enabled = false,
    showmode = false,
    hints = {
      ['vi]y'] = {
        message = function()
          return 'yoooooooooooooooooooooooooooooo' -- return the hint message you want to display
        end,
        length = 4, -- the length of actual key strokes that matches this pattern
      },
    },
    callback = function(text)
      vim.notify = require 'notify'
      vim.notify(text, vim.log.levels.WARN, { title = 'hardtime', timeout = 1000 })
    end,
  },
}
