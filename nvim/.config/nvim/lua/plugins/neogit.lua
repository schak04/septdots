return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>go", ":Neogit<CR>", noremap = true, silent = true, desc = "Open Neogit" },
    },
    config = function()
      require("neogit").setup({
        -- Use default mappings - they're better maintained
        kind = "tab",
        graph_style = "unicode",
        integrations = {
          telescope = true,
          diffview = true,
        },
      })
    end,
  },
}
