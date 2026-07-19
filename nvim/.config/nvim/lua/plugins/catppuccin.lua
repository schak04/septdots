return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          telescope = true,
          treesitter = true,
          neotree = true,
          mini = {
            enabled = true,
            indentscope_color = "lavender",
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

