# AGENTS.md for AstroNvim Configuration

## Build/Lint/Test Commands
- **Linting**: `selene` (uses neovim std, configured in selene.toml)
- **Formatting**: `stylua` (2-space indent, 120 col width, Unix line endings, auto double quotes)
- **Testing**: No dedicated tests; enable via `astrocommunity.testing` in community.lua
- **Single Test**: N/A - enable testing community plugins for neotest integration

## Code Style Guidelines
- **Language**: Lua with Neovim API
- **Imports**: `require("module")` for dependencies, `---@module` for type hints
- **Formatting**: 2-space indentation, 120 col width, Unix line endings, double quotes preferred
- **Types**: Use `---@type`, `---@param`, `---@return` for LSP type annotations
- **Naming**: snake_case for variables/functions, PascalCase for modules, descriptive names
- **Error Handling**: `pcall()` for safe requires, graceful error handling with vim.notify
- **Structure**: Plugin specs in tables with `opts` for configuration, lazy loading preferred
- **Comments**: `--` for single line, `---@` for documentation comments

## LSP/Assist Rules
- **No Cursor/Copilot rules detected** - follow standard Lua/Neovim conventions
- **Linting**: selene with relaxed rules (global_usage, if_same_then_else allowed)
- **Formatting**: Auto-formatting with stylua on save via none-ls integration

## Avante AI Assistant Setup

### API Key Configuration
Avante requires an Anthropic Claude API key to function. Set the environment variable:
```bash
export ANTHROPIC_API_KEY="your-api-key-here"
```
Or use the scoped version for isolation:
```bash
export AVANTE_ANTHROPIC_API_KEY="your-api-key-here"
```

**Current Model**: Claude 3.5 Haiku (claude-3-5-haiku-20241022) - Fast and efficient for coding tasks

### Basic Usage
- `:AvanteAsk [question]` - Ask AI about your code
- `:AvanteEdit` - Edit selected code blocks with AI
- `:AvanteToggle` - Toggle the AI chat sidebar
- `:AvanteClear` - Clear chat history

### Rollback Instructions
If you want to remove avante:
1. Comment out or remove the avante plugin spec in `lua/plugins/user.lua`
2. Restart Neovim or run `:Lazy reload`
3. Remove API key environment variables if desired
4. Delete any `avante.md` project instruction files