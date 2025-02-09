-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
  },

  {
    "szw/vim-maximizer",
    event = "VimEnter",
  },

  -- Requirements for ansible-vim
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "ansiblelint") end,
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "ansiblels") end,
  -- },

  {
    "pearofducks/ansible-vim",
    event = "User AstroFile",
        init = function()
      local function yaml_ft(path, bufnr)
        -- get content of buffer as string
        local content = vim.filetype.getlines(bufnr)
        if type(content) == "table" then content = table.concat(content, "\n") end

        -- check if file is in roles, tasks, or handlers folder
        local path_regex = vim.regex "(tasks\\|roles\\|handlers)/"
        if path_regex and path_regex:match_str(path) then return "yaml.ansible" end
        -- check for known ansible playbook text and if found, return yaml.ansible
        local regex = vim.regex "hosts:\\|tasks:"
        if regex and regex:match_str(content) then return "yaml.ansible" end

        -- return yaml if nothing else
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
  },

  {
    "AstroNvim/astrocommunity",
   import = "astrocommunity.colorscheme.catppuccin"
  },

  {
    "folke/tokyonight.nvim",
    event = "User AstroFile",
  },

  {
    "EdenEast/nightfox.nvim",
    event = "User AstroFile",
  },

  {
    "tpope/vim-surround",
    event = "User AstroFile",
  },
  {
    "nvim-lua/plenary.nvim",
    event = "User AstroFile",
  },

  {
    "hashivim/vim-terraform",
    event = "User AstroFile",
  },

  {
    "tpope/vim-fugitive",
    event = "User AstroGitFile",
  },

  {
    "David-Kunz/gen.nvim",
    event = "User AstroFile",
    opts = {
        model = "mistral-dev", -- The default model to use.
        display_mode = "split", -- The display mode. Can be "float" or "split".
        show_prompt = false, -- Shows the Prompt submitted to Ollama.
        show_model = false, -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = false, -- Never closes the window automatically.
        init = function(options) return pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
        -- Function to initialize Ollama
        command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
        -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
        -- This can also be a lua function returning a command string, with options as the input parameter.
        -- The executed command must return a JSON object with { response, context }
        -- (context property is optional).
        -- list_models = '<omitted lua function>', -- Retrieves a list of model names
        debug = false -- Prints errors and the command which is run.
    }
  },

  { "catppuccin/nvim",
    event = "User AstroFile",
    name = "catppuccin",
    priority = 1000
  },

  -- == Examples of Adding Plugins ==
  vim.keymap.set("n", "<leader>z", "<cmd>%s/<C-R><C-W>/<C-R>0/g<cr>", { desc = "lazy_replace" }),
  vim.keymap.set("n", "<leader>mw", "<cmd>MaximizerToggle<cr>", { desc = "MaximizerToggle" }),
  -- vim.keymap.set("n", "<leader>mr", "<cmd>RegexplainerShowPopup<cr>", { desc = "RegexplainerShowPopup" }),
  vim.keymap.set("n", "<leader>G", "<cmd>G<cr>", { desc = "fugitive" }),
  -- Make sure only desired input goes to the system clipboard
  vim.keymap.set("n", "x", '"_x'),
  -- vim.keymap.set("n", "c", '"_c'),
  -- vim.keymap.set("n", "C", '"_C'),
  -- vim.keymap.set("n", "s", '"_s'),
  -- vim.keymap.set("n", "d", '"_d'),
  -- vim.keymap.set("n", "D", '"_D'),

  -- require 'lspconfig'.ansiblels.setup {
  --    on_attach = function()
  --       vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  --       vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
  --       vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
  --       vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
  --       -- vim.keymap.set("n", "eh", "<cmd>TSBufToggle highlight<cr>", { buffer = 0 })
  --    end
  -- }, --- Connect to ansible language server

}
