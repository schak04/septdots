return {
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>S", function() require("spectre").open() end, noremap = true, silent = true },
      { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, noremap = true, silent = true },
      { "<leader>sp", function() require("spectre").open_file_search({ select_word = true }) end, noremap = true, silent = true },
    },
    config = function()
      require("spectre").setup({
        color_devicons = true,
        open_cmd = "noswapfile vimgrep",
        live_update = false,
        line_sep_start = "┌-----------------------------------------",
        result_padding = "│  ",
        line_sep = "├-----------------------------------------",
        highlight = {
          ui = "String",
          search = "DiffChange",
          replace = "DiffDelete",
        },
        mapping = {
          ["toggle_line"] = {
            map = "dd",
            cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
            desc = "toggle current item",
          },
          ["enter_file"] = {
            map = "<cr>",
            cmd = "<cmd>lua require('spectre.actions').enter_file()<CR>",
            desc = "open file",
          },
          ["send_to_qf"] = {
            map = "<leader>q",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix",
          },
          ["replace_all"] = {
            map = "<leader>ra",
            cmd = "<cmd>lua require('spectre.actions').replace_all()<CR>",
            desc = "replace all",
          },
          ["replace"] = {
            map = "<leader>r",
            cmd = "<cmd>lua require('spectre.actions').replace()<CR>",
            desc = "replace",
          },
          ["toggle_ignore_case"] = {
            map = "ti",
            cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
            desc = "toggle ignore case",
          },
          ["toggle_ignore_hidden"] = {
            map = "th",
            cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
            desc = "toggle search hidden files",
          },
          ["resume_last_search"] = {
            map = "<leader>l",
            cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
            desc = "resume last search",
          },
          ["refresh"] = {
            map = "<leader>u",
            cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
            desc = "refresh",
          },
          ["open_file_options"] = {
            map = "o",
            cmd = "<cmd>lua require('spectre').show_options()<CR>",
            desc = "show options",
          },
          ["run_replace"] = {
            map = "<leader>rs",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "run replace",
          },
          ["change_view"] = {
            map = "<leader>v",
            cmd = "<cmd>lua require('spectre').change_view()<CR>",
            desc = "change view mode",
          },
          ["change_replace_sed"] = {
            map = "crs",
            cmd = "<cmd>lua require('spectre').change_options('replace_cmd')<CR>",
            desc = "change replace sed command",
          },
          ["toggle_live_update"] = {
            map = "tu",
            cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
            desc = "update live",
          },
          ["toggle_word_match"] = {
            map = "tw",
            cmd = "<cmd>lua require('spectre').toggle_word_match()<CR>",
            desc = "toggle match word",
          },
          ["show_option_menu"] = {
            map = "<leader>opm",
            cmd = "<cmd>lua require('spectre').show_option_menu()<CR>",
            desc = "show option menu",
          },
        },
      })
    end,
  },
}
