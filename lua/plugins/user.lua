  return {
    "nvim-lua/plenary.nvim", -- neccesary for lots of plugins
    "mfussenegger/nvim-ansible",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { transparent_background = true } },
    { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    {
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
      },
      opts = {
        floating_window_winblend = 20, -- 20% transparency for floating window
      },
    },
  }