return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
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
