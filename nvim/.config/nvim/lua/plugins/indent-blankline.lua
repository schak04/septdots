return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        show_start = true,
        show_end = true,
      },
    },
  },
}
