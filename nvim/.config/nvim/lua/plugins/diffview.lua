return {
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gd", ":DiffviewOpen<CR>", noremap = true, silent = true },
      { "<leader>gc", ":DiffviewClose<CR>", noremap = true, silent = true },
      { "<leader>gh", ":DiffviewFileHistory<CR>", noremap = true, silent = true },
    },
  },
}
