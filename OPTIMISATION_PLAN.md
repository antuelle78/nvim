# Optimisation Plan

## 1. Remove Binary Artifacts from Git (~26MB bloat)

**Problem**: `lazygit` (19MB standalone binary) and `lazygit.tar.gz` (6.7MB) are tracked in git. The `.git/` directory is 16MB because of these files in history.

**Fix**:
- Add `.gitignore` to exclude binaries
- Remove files from tracking with `git rm --cached`
- Purge from git history with `git filter-repo` or `git rebase` to recover ~16MB in `.git`

**Files**: `/lazygit`, `/lazygit.tar.gz`

---

## 2. Remove Dead Code: Commented-Out Avante.nvim

**Problem**: ~44 lines of commented-out `avante.nvim` plugin spec in `lua/plugins/user.lua:60-104`. Replaced by `opencode.nvim` but never deleted.

**Fix**: Delete the commented block.

**File**: `lua/plugins/user.lua`

---

## 3. Remove Duplicate Config Documentation

**Problem**: `AGENT.md` and `GEMINI.md` are identical files (both describe the same AstroNvim config). `IMPROVEMENTS_SUMMARY.md` is a 330-line historical changelog from Oct 2025.

**Fix**: Delete `GEMINI.md` (redundant). `IMPROVEMENTS_SUMMARY.md` can be kept or archived — it describes the Oct 2025 migration and is mostly historical.

**Files**: `/GEMINI.md` (duplicate), `/AGENT.md` (keeper), `/IMPROVEMENTS_SUMMARY.md` (historical)

---

## 4. Resolve Duplicate `<leader>lg` Mapping

**Problem**: `<leader>lg` for LazyGit is defined in two places:
- `lua/plugins/astrocore.lua:71` — string mapping
- `lua/plugins/user.lua:52` — table mapping with `desc`

Both work, but the duplication is confusing and may cause subtle issues. AstroCore's mapping is redundant since the lazygit plugin already defines it.

**Fix**: Remove the `<leader>lg` entry from `astrocore.lua` (let the lazygit plugin's `keys` handle it).

**File**: `lua/plugins/astrocore.lua`

---

## 5. Restore or Remove Disabled none-ls Customization

**Problem**: `lua/plugins/none-ls.lua` forces an early return (`if true then return {} end`), disabling all customization. The comment says "disable to prevent conflicts with AstroNvim's none-ls setup" but this means it's dead code — the file does nothing.

**Fix**: Either:
- (a) Delete the file entirely (simplest, since AstroNvim defaults handle everything), or
- (b) Un-disable it and configure actual formatters/linters if needed

**File**: `lua/plugins/none-ls.lua`

---

## 6. Re-evaluate Lazy Loading for Plugins

**Problem**: Several plugins could be more aggressively lazy-loaded:
- `indent-blankline.nvim` — no `event` or `cmd` set (loads on every buffer)
- `catppuccin` — no lazy loading specified
- `alpha-nvim` — no lazy loading specified (should typically be loaded on startup only)
- `lualine.nvim` — no lazy loading (loads on every UI event)

**Fix**: Add appropriate `event`, `cmd`, or `ft` triggers to reduce startup impact.

**File**: `lua/plugins/user.lua`

---

## 7. Treesitter YAML Contradiction

**Problem**: `lua/plugins/treesitter.lua:9` disables treesitter highlighting for `"yaml"` and `"yaml.ansible"`, but `ensure_installed:20` still includes `"yaml"` as a parser to install.

**Fix**: Remove `"yaml"` from `ensure_installed` (parsers still cost install time and memory even if unused), or re-enable highlighting.

**File**: `lua/plugins/treesitter.lua`

---

## 8. Remove Redundant Filetype Config

**Problem**: `lua/polish.lua:30-39` defines custom filetype mappings for a `"fooscript"` filetype (`*.foo`, `Foofile`, `~/.config/foo/*`). This looks like placeholder/demo code from the AstroNvim template and serves no purpose.

**Fix**: Remove the placeholder filetype config block.

**File**: `lua/polish.lua`
