if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
  },
}

-- require "nvim-treesitter.configs".setup {
--   highlight = {
--     enable = true, -- false will disable the whole extension
--     disable = { "css", "clojure" }, -- list of language that will be disabled
--   },
-- }
