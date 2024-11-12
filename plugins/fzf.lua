return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<c-d>'] = false,
          },
        },
      },
      file_ignore_patterns = { "^./.git/", "^node_modules/", "^vendor", "%jpg", "%png" },
      extensions = {
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
          mappings = {
            default = {
              after_action = function(selection)
                print("Update to (" .. selection.z_score .. ") " .. selection.path)
              end
            },
            ["<C-s>"] = {
              before_action = function(selection) print("Before C-s") end,
              action = function(selection)
                vim.cmd.edit(selection.path)
              end
            },
            --["<C-q>"] = { action = require(require("telescope")._extension.zoxide.utils).create_basic_command("split") },
          },
        },
      },
    },
  },
}
