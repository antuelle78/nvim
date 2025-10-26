 -- This will run last in the setup process and is a good place to configure
 -- things like custom filetypes. This is just pure lua so anything that doesn't
 -- fit in the normal config locations above can go here

  -- Configure nvim-notify for transparency
  require("notify").setup({
    background_colour = "#313244", -- Catppuccin mocha surface color
    render = "minimal",
    stages = "fade_in_slide_out",
    timeout = 3000,
    on_open = function(win)
      vim.api.nvim_win_set_option(win, "winblend", 75)
    end,
  })

  -- Configure which-key
  require("which-key").setup({
    preset = "helix",
    spec = {
      { "<leader>b", group = "Buffers" },
      { "<leader>l", group = "LazyGit" },
    },
  })

  -- Configure vim-terraform
  vim.g.terraform_align = 1
  vim.g.terraform_fmt_on_save = 1

 -- Set up custom filetypes
 vim.filetype.add {
   extension = {
     foo = "fooscript",
   },
   filename = {
     ["Foofile"] = "fooscript",
   },
   pattern = {
     ["~/%.config/foo/.*"] = "fooscript",
   },
 }
