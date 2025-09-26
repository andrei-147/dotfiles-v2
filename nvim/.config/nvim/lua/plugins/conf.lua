return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- disable autoformat globally
      format_on_save = false,
    },
  },
  {
    "nvim-lua/plenary.nvim", -- dummy plugin to attach opts
    opts = {},
    config = function()
      vim.opt.tabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.expandtab = true
    end,
  },
}
