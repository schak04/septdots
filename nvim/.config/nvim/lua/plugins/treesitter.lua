return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return
      end

      configs.setup({
        auto_install = true,
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "python",
          "html",
          "css",
          "json",
          "yaml",
          "markdown",
          "markdown_inline",
          "bash",
          "vim",
          "regex",
          "sql",
          "dockerfile",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-bs>",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local status_ok, context = pcall(require, "treesitter-context")
      if not status_ok then
        return
      end

      context.setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        mode = "cursor",
        separator = nil,
        zindex = 20,
      })
    end,
  },
}