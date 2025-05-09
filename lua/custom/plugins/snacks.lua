-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

---@module "snacks"

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    dependencies = {
      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },

    -- snacks.nvim is a plugin that contains a collection of QoL improvements.
    -- One of those plugins is called snacks-picker
    -- It is a fuzzy finder, inspired by Telescope, that comes with a lot of different
    -- things that it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- Two important keymaps to use while in a picker are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Snacks picker. This is really useful to discover what snacks-picker can
    -- do as well as how to actually do it!

    -- [[ Configure Snacks Pickers ]]
    -- See `:help snacks-picker` and `:help snacks-picker-setup`
    ---@type snacks.Config
    opts = {
      picker = {},
      explorer = {},
      lazygit = {},
      indent = {
        scope = {
          underline = true,
          char = '▎',
        },
        animate = { enabled = false },
      },
    },

    -- See `:help snacks-pickers-sources`
    keys = {
      { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
      { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
      { '<leader>sf', function() Snacks.picker.smart() end, desc = '[S]earch [F]iles' },
      { '<leader>ss', function() Snacks.picker.pickers() end, desc = '[S]earch [S]elect Snacks' },
      { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord', mode = { 'n', 'x' } },
      { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
      { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
      { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
      { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)' },
      { '<leader><leader>', function() Snacks.picker.buffers() end, desc = '[ ] Find existing buffers' },
      { '<leader>/', function() Snacks.picker.lines {} end, desc = '[/] Fuzzily search in current buffer' },
      { '<leader>s/', function() Snacks.picker.grep_buffers() end, desc = '[S]earch [/] in Open Files' },
      -- Shortcut for searching your Neovim configuration files
      { '<leader>sn', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end, desc = '[S]earch [N]eovim files' },

      -- Non kickstart telescope pickers:
      { '\\', function() Snacks.explorer() end, desc = 'File Explorer' },
      { '<leader>sp', function() Snacks.picker.projects { dev = { '~/Projects/' } } end, desc = '[S]earch [P]rojects' },
      { '<leader>sM', function() Snacks.picker.man() end, desc = 'Man Pages' },
      { '<leader>hl', function() Snacks.lazygit() end, desc = '[H]hunk [L]azygit' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
