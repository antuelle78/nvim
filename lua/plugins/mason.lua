---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "ansiblels",
        "bashls",        -- Shell scripts
        "yamlls",        -- YAML
        "jsonls",        -- JSON
        "dockerls",      -- Dockerfile
        "taplo",         -- TOML
        "terraformls",   -- Terraform
        "marksman",      -- Markdown
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",        -- Lua formatter
        "prettier",      -- JS/TS/JSON/YAML/Markdown formatter
        "black",         -- Python formatter
        "shfmt",         -- Shell script formatter
        "shellcheck",    -- Shell script linter
        "yamllint",      -- YAML linter
        "markdownlint",  -- Markdown linter
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
