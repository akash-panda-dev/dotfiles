return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    'fzf-native',

    -- Add custom keymap configuration
    keymap = {
      -- Configure builtin previewer keymaps (when not using fzf-native)
      builtin = {
        -- Use ctrl-u/d for page up/down
        ['<C-d>'] = 'preview-page-down',
        ['<C-u>'] = 'preview-page-up',
        -- Use ctrl-e/y for line up/down
        ['<C-e>'] = 'preview-down',
        ['<C-y>'] = 'preview-up',

        -- Keep the default toggles
        ['<F1>'] = 'toggle-help',
        ['<F2>'] = 'toggle-fullscreen',
        ['<F3>'] = 'toggle-preview-wrap',
        ['<F4>'] = 'toggle-preview',
      },

      -- Configure fzf-native previewer keymaps
      fzf = {
        -- Scrolling
        ['ctrl-d'] = 'preview-page-down',
        ['ctrl-u'] = 'preview-page-up',
        ['ctrl-e'] = 'preview-down',
        ['ctrl-y'] = 'preview-up',

        -- Keep the default fzf operations
        ['ctrl-z'] = 'abort',
        ['ctrl-f'] = 'half-page-down',
        ['ctrl-b'] = 'half-page-up',
        ['ctrl-a'] = 'beginning-of-line',
        ['alt-a'] = 'toggle-all',
      },
    },

    global_resume = true,
    global_history = true,
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = {
        default = 'bat',
        layout = 'vertical',
        vertical = 'down:60%',
        scrollbar = 'float',
        title = true,
        delay = 100,
      },
    },

    files = {
      multiprocess = true,
      previewer = false,
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git]],
    },
    oldfiles = {
      previewer = false, -- Disable preview for oldfiles
    },

    grep = {
      multiprocess = true,
      rg_opts = [[--column --line-number --no-heading --color=always --smart-case --max-columns=512]],
      rg_glob = true,
      glob_flag = '--iglob',
      glob_separator = '%s%-%-',
    },

    previewers = {
      bat = {
        cmd = 'bat',
        args = '--style=numbers,changes --color always',
        theme = 'gruvbox-dark',
      },
    },
  },
  keys = {
    { '<leader>ff', '<cmd>FzfLua files<CR>', desc = 'Find files' },
    { '<leader>fg', '<cmd>FzfLua live_grep<CR>', desc = 'Live grep' },
    { '<leader>fb', '<cmd>FzfLua buffers<CR>', desc = 'Find buffers' },
    { '<leader>fh', '<cmd>FzfLua help_tags<CR>', desc = 'Help tags' },
    { '<leader>fo', '<cmd>FzfLua oldfiles<CR>', desc = 'Recent files' },
    { '<leader>fc', '<cmd>FzfLua commands<CR>', desc = 'Commands' },
    { '<leader>fr', '<cmd>FzfLua resume<CR>', desc = 'Resume last search' },
    { '<leader>f/', '<cmd>FzfLua search_history<CR>', desc = 'Search history' },
    { '<leader>fs', '<cmd>FzfLua lsp_document_symbols<CR>', desc = 'Document symbols' },
    { '<leader>fw', '<cmd>FzfLua grep_cword<CR>', desc = 'Search current word' },
  },
}
