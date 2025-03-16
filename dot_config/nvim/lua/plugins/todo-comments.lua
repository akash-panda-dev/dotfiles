-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'InsertEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
  },
}
