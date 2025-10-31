  return {
    "nvim-lua/plenary.nvim", -- neccesary for lots of plugins
    { "mfussenegger/nvim-ansible", ft = { "ansible", "yaml.ansible" } },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        options = {
          theme = "catppuccin",
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "█", right = "█" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      },
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {
        scope = {
          enabled = true,
        },
      },
    },
    { "hashivim/vim-terraform", ft = { "terraform", "tf" } },

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
         floating_window_winblend = 75, -- 75% transparency for floating window
       },
     },

     -- AI-powered code assistant (Cursor-like functionality)
     {
       "yetone/avante.nvim",
       event = "VeryLazy",
       lazy = false,
       version = false, -- Never set to "*"!
       build = "make",
       opts = {
         provider = "claude",
         auto_suggestions_provider = "claude",
          providers = {
             claude = {
               endpoint = "https://api.anthropic.com",
               model = "claude-3-5-haiku-20241022",
               extra_request_body = {
                 temperature = 0,
                 max_tokens = 4096,
               },
             },
          },
         behaviour = {
           auto_suggestions = false, -- Experimental, disable for stability
           auto_apply_diff_after_generation = false,
         },
         mappings = {
           --- @class AvanteConflictMappings
           diff = {
             ours = "co",
             theirs = "ct",
             all_theirs = "ca",
             both = "cb",
             cursor = "cc",
             next = "]x",
             prev = "[x",
           },
         },
       },
       dependencies = {
         "nvim-lua/plenary.nvim", -- Already included above
         "MunifTanjim/nui.nvim",
         "nvim-tree/nvim-web-devicons", -- Already included above
         "stevearc/dressing.nvim",
         "nvim-telescope/telescope.nvim",
       },
     },
   }