-- Neovim plugin configuration
--
-- This file defines plugins using Lazy.nvim with event-based loading.
-- The configuration is refactored for readability and performance.
--
-- Helper to create plugin specs with default values
local function plugin(name, opts)
  -- Default options can be merged here if needed
  return vim.tbl_extend('force', {name=name}, opts or {})
end

-- Event constants
local vim_enter_event = "VimEnter"
local astro_event = "User AstroFile"
local astro_git_event = "User AstroGitFile"
local very_lazy_event = "VeryLazy"

-- Main plugin specification table
return {
  -- ===============================
  -- UI Enhancements
  -- ===============================
  plugin("szw/vim-maximizer", {event = vim_enter_event}),

  plugin("AstroNvim/astrocommunity", {import = "astrocommunity.colorscheme.catppuccin"}),

  plugin("nvim-lua/plenary.nvim", {event = astro_event}),

  plugin("hashivim/vim-terraform", {event = astro_event}),

  plugin("nvim-tree/nvim-web-devicons", {event = astro_git_event}),

  -- ===============================
  -- Language Server & Filetype Support
  -- ===============================
  plugin("pearofducks/ansible-vim", {
    event = astro_event,
    init = function()
      local function yaml_ft(path, bufnr)
        local content = vim.filetype.getlines(bufnr)
        if type(content) == "table" then content = table.concat(content, "\n") end

        local path_regex = vim.regex "(tasks\\|roles\\|handlers)/"
        if path_regex and path_regex:match_str(path) then return "yaml.ansible" end

        local regex = vim.regex "hosts:\\|tasks:"
        if regex and regex:match_str(content) then return "yaml.ansible" end

        return "yaml"
      end

      vim.filetype.add {
        extension = {
          yml = yaml_ft,
          yaml = yaml_ft,
        },
      }
    end,
    ft = "yaml.ansible",
  }),

  plugin("lspconfig.ansiblels", {
    on_attach = function()
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
      vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
      vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
      vim.keymap.set("n", "eh", "<cmd>TSBufToggle highlight<cr>", { buffer = 0 })
    end,
  }),

  -- ===============================
  -- Productivity Plugins
  -- ===============================
  plugin("kdheepak/lazygit.nvim", {
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  }),

  plugin("Exafunction/codeium.vim", {
    event = "BufEnter",
    config = function()
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end,
  }),

  plugin("yetone/avante.nvim", {
    build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = very_lazy_event,
    version = false,
    opts = {
      instructions_file = "avante.md",
      provider = "ollama",
      providers = {
        ollama = {
          endpoint = "http://localhost:11434",
          model = "gptoss_16k",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        moonshot = {
          endpoint = "https://api.moonshot.ai/v1",
          model = "kimi-k2-0711-preview",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 32768,
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-mini/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = very_lazy_event,
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  }),

  -- ===============================
  -- Keybindings
  -- ===============================
  vim.keymap.set("n", "<leader>z", "<cmd>%s/<C-R><C-W>/<C-R>0/g<cr>", { desc = "lazy_replace" }),
  vim.keymap.set("n", "<leader>mw", "<cmd>MaximizerToggle<cr>", { desc = "MaximizerToggle" }),
  vim.keymap.set("n", "x", '"_x'),
}

-- End of plugin configuration

