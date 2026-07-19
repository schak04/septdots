return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>dc", dap.continue, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>dn", dap.step_over, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>di", dap.step_into, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>do", dap.step_out, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { noremap = true, silent = true })
    end,
  },
}
