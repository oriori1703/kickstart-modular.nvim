return {
  {
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'catppuccin-mocha', 'catppuccin-latte', or 'catppuccin-frappe'.
      vim.cmd.colorscheme 'catppuccin'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
