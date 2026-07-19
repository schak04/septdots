return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = { "truncate" },
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              width = 0.9,
              height = 0.95,
            },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      local builtin = require("telescope.builtin")

      -- File finding
      vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })

      -- Search
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true, desc = "Live grep" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { noremap = true, silent = true, desc = "Grep word" })

      -- Buffers and history
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true, desc = "Find buffers" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { noremap = true, silent = true, desc = "Recent files" })

      -- Git
      vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { noremap = true, silent = true, desc = "Git commits" })
      vim.keymap.set("n", "<leader>fgs", builtin.git_status, { noremap = true, silent = true, desc = "Git status" })

      -- Help
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true, desc = "Help tags" })

      local status_ok, _ = pcall(require("telescope").load_extension, "ui-select")
      if not status_ok then
        vim.notify("Failed to load telescope ui-select extension", vim.log.levels.WARN)
      end
    end,
  },
}
