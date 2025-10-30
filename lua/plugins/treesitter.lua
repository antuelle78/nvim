-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enable = true,
      disable = { "yaml", "yaml.ansible" }
    },
    ensure_installed = {
      "lua",
      "vim",
      "terraform",
      "python",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
