-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "jay-babu/mason-null-ls.nvim", -- Ensure Mason installs tools first
  },
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Formatters (installed via Mason)
      null_ls.builtins.formatting.stylua,      -- Lua
      null_ls.builtins.formatting.prettier,    -- JS/TS/JSON/YAML/Markdown
      null_ls.builtins.formatting.black,       -- Python
      null_ls.builtins.formatting.shfmt,       -- Shell scripts

      -- Linters/Diagnostics (installed via Mason)
      null_ls.builtins.diagnostics.shellcheck, -- Shell scripts
      null_ls.builtins.diagnostics.yamllint,   -- YAML
      null_ls.builtins.diagnostics.markdownlint, -- Markdown
    })
    
    return opts
  end,
}
