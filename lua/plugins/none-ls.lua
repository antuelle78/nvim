-- Customize None-ls sources
-- Note: AstroNvim already includes default sources (stylua, prettier, black, shfmt, yamllint, markdownlint, etc.)
-- This configuration adds additional sources or overrides defaults if needed

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "jay-babu/mason-null-ls.nvim", -- Ensure Mason installs tools first
  },
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- AstroNvim already includes: stylua, prettier, black, shfmt, yamllint, markdownlint, ansiblelint, selene, isort
    -- Only add sources that are NOT already included by default to avoid conflicts

    -- Helper function to check if a command exists
    local function command_exists(cmd)
      return vim.fn.executable(cmd) == 1
    end

    -- Only insert new sources, do not replace the existing ones
    local sources = {}

    -- Add any additional formatters/linters here that AstroNvim doesn't include by default
    -- Currently, AstroNvim covers all the major ones we want, so this is empty

    -- Example of how to add additional sources in the future:
    -- if command_exists("some_tool") then
    --   table.insert(sources, null_ls.builtins.formatting.some_formatter)
    -- end

    opts.sources = require("astrocore").list_insert_unique(opts.sources, sources)

    return opts
  end,
}
