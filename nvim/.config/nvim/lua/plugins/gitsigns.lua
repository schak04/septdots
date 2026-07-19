return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          enable = true,
          interval = 1000,
          follow_files = true,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]h", function()
            if vim.wo.diff then
              return "]h"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[h", function()
            if vim.wo.diff then
              return "[h"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk, { noremap = true, silent = true })
          map("n", "<leader>hr", gs.reset_hunk, { noremap = true, silent = true })
          map("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { noremap = true, silent = true })
          map("v", "<leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { noremap = true, silent = true })
          map("n", "<leader>hS", gs.stage_buffer, { noremap = true, silent = true })
          map("n", "<leader>hu", gs.undo_stage_hunk, { noremap = true, silent = true })
          map("n", "<leader>hR", gs.reset_buffer, { noremap = true, silent = true })
          map("n", "<leader>hp", gs.preview_hunk, { noremap = true, silent = true })
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end, { noremap = true, silent = true })
          map("n", "<leader>hd", gs.diffthis, { noremap = true, silent = true })
        end,
      })
    end,
  },
}
