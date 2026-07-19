return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", desc = "Toggle terminal (horizontal)" },
      { "<leader>tf", desc = "Toggle terminal (float)" },
      { "<leader>tv", desc = "Toggle terminal (vertical)" },
      { "<leader>gg", desc = "Lazygit" },
    },
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = "horizontal", -- Default to horizontal (like VS Code)
        close_on_exit = true,
        shell = "powershell.exe",
        auto_scroll = true,
        float_opts = {
          border = "curved",
          winblend = 0,
        },
      })

      -- Keymaps for different terminal types
      vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true, desc = "Terminal (horizontal)" })
      vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Close terminal" })
      
      vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true, desc = "Terminal (float)" })
      vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { noremap = true, silent = true, desc = "Terminal (vertical)" })

      -- Lazygit integration
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.keymap.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true, desc = "Lazygit" })
    end,
  },
}
