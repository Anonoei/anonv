--     ___                _   ___    __
--    /   |  ____  ____  / | / / |  / /
--   / /| | / __ \/ __ \/  |/ /| | / /
--  / ___ |/ / / / /_/ / /|  / | |/ /
-- /_/  |_/_/ /_/\____/_/ |_/  |___/
--
require('anonv/lua/keymaps_pre')
require('anonv/lua/define_pre')

require('anonv/lua/lazy') -- Install LazyVim

require("lazy").setup({
  spec = {
    -- add LazyVim and import plugin
    { "LazyVim/LazyVim",       import = "lazyvim.plugins" },
    --{ import = "lazyvim.plugins.extras.lang.python" },
    -- Import AnoNV
    { import = "anonv/plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = {
    enabled = true,
    notify = false
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "zipPlugin",
      }
    }
  },
})


-- || Configure Telescope || --
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    file_ignore_patterns = { "^./.git/", "^node_modules/", "^vendor/", "%.jpg", "%.png" },
  },
}
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- File browser plugin for telescope
--require("telescope").load_extension("file_browser")

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('anonv/lua/keymaps_post')
require('anonv/lua/define_post')
