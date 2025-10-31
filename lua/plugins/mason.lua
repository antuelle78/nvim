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
   -- Override AstroNvim's mason-null-ls to prevent duplicate source registration
   {
     "jay-babu/mason-null-ls.nvim",
     opts = {
       -- Don't auto-install or auto-register sources to avoid conflicts
       ensure_installed = {},
       automatic_installation = false,
       automatic_setup = false,
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
