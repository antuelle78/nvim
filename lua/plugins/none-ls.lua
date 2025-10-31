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

    -- Helper function to check if a command exists
    local function command_exists(cmd)
      return vim.fn.executable(cmd) == 1
    end

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    local sources = {}

    -- Formatters (only add if available)
    if command_exists("stylua") then
      table.insert(sources, null_ls.builtins.formatting.stylua)      -- Lua
    end
    if command_exists("prettier") then
      table.insert(sources, null_ls.builtins.formatting.prettier)    -- JS/TS/JSON/YAML/Markdown
    end
    if command_exists("black") then
      table.insert(sources, null_ls.builtins.formatting.black)       -- Python
    end
    if command_exists("shfmt") then
      table.insert(sources, null_ls.builtins.formatting.shfmt)       -- Shell scripts
    end

    -- Linters/Diagnostics (only add if available)
    -- Note: shellcheck is not available as a none-ls builtin in current version
    -- Consider using nvim-lint or efm-langserver for shellcheck integration
    if command_exists("yamllint") then
      table.insert(sources, null_ls.builtins.diagnostics.yamllint)   -- YAML
    end
    if command_exists("markdownlint") then
      table.insert(sources, null_ls.builtins.diagnostics.markdownlint) -- Markdown
    end

    opts.sources = require("astrocore").list_insert_unique(opts.sources, sources)

    return opts
  end,
}
