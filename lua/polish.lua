 -- This will run last in the setup process and is a good place to configure
 -- things like custom filetypes. This is just pure lua so anything that doesn't
 -- fit in the normal config locations above can go here

 -- Configure nvim-notify for transparency
 require("notify").setup({
   background_colour = "#313244", -- Catppuccin mocha surface color
   render = "minimal",
   stages = "fade_in_slide_out",
   timeout = 3000,
 })

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
