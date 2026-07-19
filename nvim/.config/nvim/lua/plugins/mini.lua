return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      -- Mini.ai - Better text objects
      require("mini.ai").setup()

      -- Mini.statusline - Lightweight status line
      require("mini.statusline").setup({
        content = {
          active = nil,
          inactive = nil,
        },
        use_icons = true,
        set_vim_settings = true,
      })

      -- Mini.pairs - Better pair handling
      require("mini.pairs").setup()
    end,
  },
}
