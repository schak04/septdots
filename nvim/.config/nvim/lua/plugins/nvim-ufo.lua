return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })

      -- Using vim's builtin fold commands
      vim.keymap.set("n", "zR", require("ufo").openAllFolds, { noremap = true, silent = true, desc = "Open all folds" })
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { noremap = true, silent = true, desc = "Close all folds" })
      
      -- Standard vim fold commands work with ufo
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },
}
