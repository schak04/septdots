return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
      { "<leader>gs", ":Git<CR>", noremap = true, silent = true },
      { "<leader>gp", ":Git push<CR>", noremap = true, silent = true },
      { "<leader>gu", ":Git pull<CR>", noremap = true, silent = true },
      { "<leader>gm", ":Git merge ", noremap = true },
    },
  },
}
