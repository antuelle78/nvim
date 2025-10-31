-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  
  -- Enhanced motion and editing
  { import = "astrocommunity.motion.mini-move" },           -- Move lines/blocks easily
  { import = "astrocommunity.editing-support.mini-splitjoin" }, -- Split/join code blocks
  
  -- LSP enhancements
  { import = "astrocommunity.lsp.lsp-signature-nvim" },    -- Function signatures while typing
  
  -- Better code runners
  { import = "astrocommunity.code-runner.sniprun" },        -- Run code snippets
  
  -- Utility enhancements
  { import = "astrocommunity.utility.noice-nvim" },         -- Better UI for messages/cmdline/popupmenu
  
  -- import/override with your plugins folder
}