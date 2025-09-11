# Agent Guidelines for Dotfiles Repository

## Build/Lint/Test Commands
- **Build/Symlink**: `make stow` - Creates symlinks for all dotfiles using GNU Stow
- **Format Lua**: `stylua .` - Formats all Lua files according to stylua.toml
- **Lint Lua**: `stylua --check .` - Checks Lua formatting without modifying files
- **No traditional testing** - This is a configuration repository

## Code Style Guidelines

### Lua (Neovim Configuration)
- **Indentation**: 2 spaces (configured in stylua/stylua.toml)
- **Naming**: Use descriptive variable names, local variables for conciseness (e.g., `local keymap = vim.keymap`)
- **Imports**: Use `require()` at top of files, group related requires together
- **Functions**: Use anonymous functions for keymaps, prefer vim.keymap.set() over vim.api calls
- **Comments**: Use `--` for single-line comments, place above code they describe
- **Error Handling**: Use vim.notify() for user-facing errors, check for nil values
- **Tables**: Use trailing commas in multi-line tables for consistency

### General
- **Formatting**: Prettier for JS/TS with single quotes, 2-space indentation
- **Trailing Whitespace**: Automatically trimmed (VSCode setting)
- **File Structure**: Keep related configurations in dedicated directories
- **No TypeScript**: Pure Lua for Neovim, no type annotations needed

### Keymaps
- **Leader**: Space (` `) for global commands, semicolon (`;`) for local
- **Descriptions**: Always include `desc` field for discoverability
- **Consistency**: Use `vim.keymap.set()` with `{ noremap = true, silent = true }`

### Plugin Management
- **Lazy.nvim**: Use plugin specs with proper event loading and dependencies
- **Configuration**: Place plugin configs in dedicated files under lua/plugins/
- **Dependencies**: Explicitly declare plugin dependencies in spec tables