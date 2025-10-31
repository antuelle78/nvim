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

     -- Lightning-fast cursor motion
     {
       "folke/flash.nvim",
       event = "VeryLazy",
       opts = {},
       keys = {
         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
         { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
         { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
         { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
         { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
       },
     },

     -- Better diagnostics list and quickfix
     {
       "folke/trouble.nvim",
       cmd = { "Trouble" },
       opts = {},
       keys = {
         { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
         { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
         { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
         { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
         { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
         { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
       },
     },

     -- Enhanced git diffs and merge conflict resolution
     {
       "sindrets/diffview.nvim",
       cmd = { "DiffviewOpen", "DiffviewFileHistory" },
       opts = {},
       keys = {
         { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
         { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
         { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo History" },
       },
     },

     -- Enhanced text objects and operators
     {
       "echasnovski/mini.ai",
       event = "VeryLazy",
       opts = function()
         local ai = require("mini.ai")
         return {
           n_lines = 500,
           custom_textobjects = {
             o = ai.gen_spec.treesitter({
               a = { "@block.outer", "@conditional.outer", "@loop.outer" },
               i = { "@block.inner", "@conditional.inner", "@loop.inner" },
             }, {}),
             f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
             c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
           },
         }
       end,
     },

     -- Surround text objects (add/delete/change surrounding chars)
     {
       "kylechui/nvim-surround",
       event = "VeryLazy",
       opts = {},
     },

     -- Project-wide search and replace
     {
       "nvim-pack/nvim-spectre",
       cmd = "Spectre",
       opts = {},
       keys = {
         { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
       },
     },
   }