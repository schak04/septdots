return {
  {
    "vim-test/vim-test",
    event = "VeryLazy",
    dependencies = {
      "preservim/vimux",
    },
    keys = {
      { "<leader>tn", ":TestNearest<CR>", noremap = true, silent = true },
      { "<leader>tf", ":TestFile<CR>", noremap = true, silent = true },
      { "<leader>ts", ":TestSuite<CR>", noremap = true, silent = true },
      { "<leader>tl", ":TestLast<CR>", noremap = true, silent = true },
      { "<leader>tv", ":TestVisit<CR>", noremap = true, silent = true },
    },
    config = function()
      vim.g["test#strategy"] = "vimux"
      vim.g["test#neovim#term_opts"] = { modifiable = false }
    end,
  },
}
