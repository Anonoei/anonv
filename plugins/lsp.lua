return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
          pip = {
            upgrade_pip = true,
          },
        },
      },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            --"bashls",        -- Bash
            "clangd", -- C/C++
            "cmake",  -- cmake
            --"gopls",         -- Go
            --"html",          -- HTML
            --"eslint",        -- JavaScript/TypeScript
            --"jsonls",        -- json
            "ltex",          -- LaTex
            "lua_ls",        -- Lua
            "marksman",      -- Markdown
            "powershell_es", -- PowerShell
            "ruff",          -- Python
            "rust_analyzer", -- Rust
            --"sqls",          -- SQL
            "textlsp",       -- text
            "taplo",         -- TOML
            --"vimls",         -- VimScript
            --"yamlls",        -- YAML
            "typos_lsp", -- Typos
          },
        },
      },
      -- Status updates for LSP
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
      { "nvim-cmp" }
    },
    opts = {},
  },
}
