# Dotfiles symlinked on my machine

## MacOS

Repeat key strokes

```
defaults write -g ApplePressAndHoldEnabled -bool false
```

Finder application set column view to default

```
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
```

## Setup

### Install [Homebrew](https://brew.sh)

### SymLink dotfiles to their correct MacOS directories with stow:

```bash
brew install stow
make
```

### Install Dependencies

Required packages:

```bash
brew install nushell carapace atuin fzf fd bat git-delta eza ripgrep tree neovim starship
brew install --cask font-jetbrains-mono-nerd-font font-maple-mono-nf font-recursive-mono-nerd-font
brew services start atuin
```

Nice additions:

```bash
brew install asdf git coreutils curl libpq btop tldr yazi
brew install jesseduffield/lazygit/lazygit
```

Optional supported Terminals / GUIs

```bash
brew install --cask wezterm ghostty
brew install --cask neovide
```

## Command Line Notes

### [NuShell](https://www.nushell.sh)

- Zsh is still the default terminal, but NuShell is the default shell in Alacritty and WezTerm
- Autocompletion is handled via: [Carapace](https://carapace.sh)
- eza is aliased as `ls`
- NuShell ls can be accessed via `nuls`
- NuShell prompt has been configured with [Starship](https://starship.rs)

### bat

- `cat` has been aliased to `bat` with better syntax highlighting

### fzf

- `<C-t>` search files by name
- `<C-r>` search recent commands

## NeoVim Plugin Notes

### Telescope

1. `<C-d>` scrolls the preview text down
2. `<C-u>` scrolls the preview text up
3. `<C-v>` opens in a new vertical split
4. `<C-t>` opens in a new tab

### vim-visual-multi

Basic usage:

- select words with Ctrl-N (like `Ctrl-d` in Sublime Text/VS Code)
- create cursors vertically with Ctrl-Down/Ctrl-Up
- select one character at a time with Shift-Arrows
- press n/N to get next/previous occurrence
- press [/] to select next/previous cursor
- press q to skip current and get next occurrence
- press Q to remove current cursor/selection
- start insert mode with i,a,I,A

Two main modes:

- in *cursor mode* commands work as they would in normal mode
- in *extend mode* commands work as they would in visual mode
- press Tab to switch between «cursor» and «extend» mode

Most vim commands work as expected (motions, r to replace characters, ~ to change case, etc). Additionally you can:

- run macros/ex/normal commands at cursors
- align cursors
- transpose selections
- add patterns with regex, or from visual mode

And more... of course, you can enter insert mode and autocomplete will work.

### mini-ai

1. Mutli type edits (works better will registers such as `.`)
   1. Brackets (supports `({[`):
      1. `cib` change inside bracket
      2. `dib` delete inside bracket
      3. `cab` change around bracket
      4. `dab` change around bracket
   2. Quotes (supports ``"`'``):
      1. `ciq` change inside quote
      2. `diq` delete inside quote
      3. `cab` change around bracket
      4. `dab` change around bracket
1. Treesitter upgrades
   1. Arguments:
      1. `cia` change in next argument
      2. `cina` change in next argument
      3. `cana` change around next argument
      4. `cila` change in last argument
      5. `cala` change around last argument
   2. Function:
      1. `dif` delete in function
      2. `dinf` delete in next function
      3. `dana` delete around next function
      4. `dila` delete in last function
      5. `dala` delete around last function

## VS Code

Install the cmdline tools

```
code --install-extension ms-vscode.cpptools
```

List current extensions

```
code --list-extensions
```

Install extensions

```
code --install-extension bradlc.vscode-tailwindcss
code --install-extension dbaeumer.vscode-eslint
code --install-extension deerawan.vscode-dash
code --install-extension eamodio.gitlens
code --install-extension enkia.tokyo-night
code --install-extension esbenp.prettier-vscode
code --install-extension github.codespaces
code --install-extension github.copilot
code --install-extension github.copilot-chat
code --install-extension misogi.ruby-rubocop
code --install-extension mjmcloug.vscode-elixir
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension shopify.ruby-lsp
code --install-extension ue.alphabetical-sorter
code --install-extension vscodevim.vim
code --install-extension vue.volar
```

## Install Vi (Non NeoVim) Plugins:

Launch vim and run `:PluginInstall`
To install from command line: `vim +PluginInstall +qall`
