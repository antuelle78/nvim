# AGENTS.md for Neovim Configuration

## Build/Lint/Test Commands
- **Linting**: Run `selene` (based on selene.toml with neovim std) to check Lua code.
- **Formatting**: Use `stylua` (per .stylua.toml: 2-space indent, 120 col width).
- **Testing**: No dedicated tests. Use `nvim --headless -c "lua require('test')" -c "qa"` for Lua execution.
- **Single Test**: N/A - no test framework detected.

## Code Style Guidelines
- **Language**: Lua for Neovim configuration.
- **Imports**: Use `require("module")` for dependencies.
- **Formatting**: Follow .stylua.toml: 2-space indentation, Unix line endings, auto double quotes.
- **Types**: Annotate with ---@type for LSP support.
- **Naming**: snake_case for variables, camelCase for functions, descriptive names.
- **Error Handling**: Use pcall for safe requires, handle errors gracefully.
- **Comments**: Use -- for comments, explain complex logic.
- **Structure**: Group related configs in tables, use opts for plugin settings.

## LSP/Assist Rules
- **Cursor**: Follow .cursor/rules/ for auto-imports and snippet rules
- **Copilot**: Enable with `:Copilot enable` - use `--comment` flag for comment-based prompts
- **Linting**: selene.toml enforces Lua style guidelines
- **Formatting**: stylua (2-space indent, 120-col width) autoformats on save