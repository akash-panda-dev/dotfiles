return {
  'tpope/vim-fugitive',
  config = function()
    -- Keymaps for merge conflict resolution
    vim.keymap.set('n', '<leader>gh', ':diffget //2<CR>', { desc = 'Get left (ours) changes' })
    vim.keymap.set('n', '<leader>gl', ':diffget //3<CR>', { desc = 'Get right (theirs) changes' })
    -- Additional useful fugitive mappings
    vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Git status' })
    vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = 'Git commit' })
    vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = 'Git push' })
    vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit!<CR>', { desc = 'Git diff split' })
  end,
}
