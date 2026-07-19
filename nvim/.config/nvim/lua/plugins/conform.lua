return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier", stop_after_first = true },
          typescript = { "prettier", stop_after_first = true },
          javascriptreact = { "prettier", stop_after_first = true },
          typescriptreact = { "prettier", stop_after_first = true },
          json = { "prettier", stop_after_first = true },
          yaml = { "prettier", stop_after_first = true },
          html = { "prettier", stop_after_first = true },
          css = { "prettier", stop_after_first = true },
          markdown = { "prettier", stop_after_first = true },
          python = { "isort", "black" },
          rust = { "rustfmt" },
          go = { "gofmt" },
          c = { "clang-format" },
          cpp = { "clang-format" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format file or range" })
    end,
  },
}
