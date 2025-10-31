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
      "vimdoc",
      "terraform",
      "hcl",
      "python",
      "yaml",
      "bash",
      "json",
      "toml",
      "markdown",
      "markdown_inline",
      "git_config",
      "gitignore",
      "dockerfile",
      "regex",
      "javascript",
      "typescript",
      "html",
      "css",
    },
  },
}
