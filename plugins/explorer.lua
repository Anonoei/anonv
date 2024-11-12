return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "Neotree",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {},
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    config = function()
      require("nvim-tree").setup {
        sort = { sorter = "case_sensitive", },
        view = { width = 30 },
        renderer = { group_empty = true },
        filters = { dotfiles = true },
      }
    end,
  },
}
