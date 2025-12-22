# Dotfiles symlinked on my machine

## MacOS

Repeat key strokes

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

Finder application set column view to default

```bash
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
```

### Mac Dev Applications

1. [Postgresql App](https://postgresapp.com/downloads.html) (needed to enable `psql` from the cmdline)
2. [Postman](https://www.postman.com/downloads/)

## Setup

### Install [Homebrew](https://brew.sh)

### SymLink dotfiles to their correct MacOS directories with stow:

```bash
brew install stow
make
```

### Install Dependencies

I have started using a payed font: [MonoLisa](https://www.monolisa.dev/playground). You can either download a free trial or update the font references to your preferred font.

Required packages:

```bash
brew install atuin bat carapace eza fd fz git git-delta neovim nushell ripgrep starship tree yazi zoxide
brew install --cask font-jetbrains-mono-nerd-font font-maple-mono-nf
brew install jesseduffield/lazygit/lazygit
brew install jesseduffield/lazydocker/lazydocker
brew install sst/tap/opencode
brew services start atuin
```

Nice additions:

```bash
brew install asdf btop coreutils db-browser-for-sqlite libpq tldr
```

Other fonts I sometimes use:

```bash
brew install --cask font-lilex-nerd-font font-recursive-mono-nerd-font font-cascadia-code-nf
```

Optional supported Terminals / GUIs:

```bash
brew install --cask ghostty
brew install --cask wezterm
brew install --cask neovide-app
```

## Command Line Notes

### [NuShell](https://www.nushell.sh)

- Zsh is still the default terminal, but NuShell is the default shell in Ghostty and WezTerm
- NuShell ls can be accessed via `nuls`
- NuShell prompt has been configured with [Starship](https://starship.rs)

### [bat](https://github.com/sharkdp/bat)

- `cat` has been aliased to `bat` with better syntax highlighting

### [Carapace](https://carapace.sh)

- Autocompletion package set in the NuShell config

### [eza](https://github.com/eza-community/eza)

- `eza` is aliased as `ls` adding colors and nerd-font file icons

### [fzf](https://github.com/junegunn/fzf)

- `<C-t>` search files by name
- `<C-r>` search recent commands

### [ripgrep](https://github.com/BurntSushi/ripgrep)

- `rg` search standard files using the .gitignore file to ignore specific files
- `rg -.` search hidden files
- `rg -u` search (unrestricted) ignored files
- `rg -uu` search (unrestricted) ignored and hidden files
- `rg -t=ruby` search ruby files
- `rg -t=js` search javascript files

### [LazyGit](https://github.com/jesseduffield/lazygit)

- `lazygit` or `lg` to launch
- `<Space>` to add remove file
- `<Enter>` to stage hunks
- `c` to commit
- `?` for help
- `[1-5]` for quick navigation

#### Vim Style Bindings:

- `h` quick navigation up
- `j` up
- `k` down
- `l` quick navigation down
- `q` to quit

### [Yazi](https://yazi-rs.github.io/docs/installation) file manager

- `yazi` or `y` to launch

#### Vim Style Bindings:

- `h` parent dir
- `j` up
- `k` down
- `l` child dir
- `<C-d>` page down
- `<C-u>` page up
- `G` bottom of list
- `gg` top of list
- `y` to yank
- `p` to paste
- `H` for previous dir
- `L` for to walk back up the list of recent dirs
- `/` to search local dir
- `<Esc>` or `q` to exit

#### Yazi Commands

- `~` to lisk all commands
- `<Space>` to select
- `a` add file
- `r` to rename
- `o` for open file
- `d` to delete
- `D` to permanently delete
- `<Tab>` for file info
- `c` for copying to clipboard (additional options on screen)

#### Searching

- `z` for zioxide (better cd navigation)
- `Z` for fzf
- `s` to search file names under dir
- `S` to search for text In files
- `f` to filter

#### Tabs

- `t` to create a new tab
- `[1-0]` to navigate though tabs
- `<C-c>` to close tab

## [NeoVim](https://neovim.io)

### [copilot](https://github.com/github/copilot.vim)

To initialize and authenticate copilot:

```bash
:Copilot setup
```

### [Snacks.picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md)

- `J` scrolls the preview text down
- `K` scrolls the preview text up
- `<C-v>` opens in a new vertical split

### [vim-visual-multi](https://github.com/mg979/vim-visual-multi)

Basic usage:

- select words with `<C-N>` (like `<C-d>` in Sublime Text/VS Code)
- create cursors vertically with Ctrl-Down/Ctrl-Up
- select one character at a time with Shift-Arrows
- press `n` / `N` to get next/previous occurrence
- press `[` / `]` to select next/previous cursor
- press `q` to skip current and get next occurrence
- press `Q` to remove current cursor/selection
- start insert mode with `i`, `a`, `I`, or `A`

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

### [mini-ai](https://github.com/nvim-mini/mini.ai)

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

### [mini-splitjoin](https://github.com/nvim-mini/mini.splitjoin)

- `gS` toggle split/join

### [mini-bracketed](https://github.com/nvim-mini/mini.bracketed)

- `[` + upper-suffix : go first.
- `[` + lower-suffix : go backward.
- `]` + lower-suffix : go forward.
- `]` + upper-suffix : go last.

```lua
buffer     = { suffix = 'b' },
comment    = { suffix = 'c' },
conflict   = { suffix = 'x' },
diagnostic = { suffix = 'd' },
file       = { suffix = 'f' },
indent     = { suffix = 'i' },
jump       = { suffix = 'j' },
location   = { suffix = 'l' },
oldfile    = { suffix = 'o' },
quickfix   = { suffix = 'q' },
treesitter = { suffix = 't' },
undo       = { suffix = 'u' },
window     = { suffix = 'w' },
yank       = { suffix = 'y' },
```

### Colorscheme

The following are configured to use [Tokyonight](https://github.com/folke/tokyonight.nvim) in dark mode and [Catppuccin Latte](https://github.com/catppuccin/catppuccin) in light mode. Note: btop can not transition automatically and is only configured for dark mode.

- [x] Ghostty
- [x] LazyGit
- [x] NeoVim
- [x] NeoVim bufferline plugin
- [x] NeoVim lualine plugin
- [x] Wezterm
- [x] Yazi
- [x] bat
- [ ] btop
- [x] delta
- [x] fd
- [x] fzf

## ASDF Version Manager

Install language plugins

```bash
asdf plugin add elixir
asdf plugin add nodejs
asdf plugin add ruby
asdf plugin add pnpm
```

Install the latest versions

```bash
asdf install elixir latest
asdf install nodejs latest
asdf install ruby latest
asdf install pnpm latest
```

npm global config

```bash
npm install --global corepack@latest
```

Check for new plugin versions

```bash
asdf plugin update --all
```

## NeoVim RubyLSP Plugins

```bash
gem install bundler ruby-lsp rubocop erb_lint erb-formatter yard
```

## VS Code

Install the cmdline tools

```bash
code --install-extension ms-vscode.cpptools
```

List current extensions

```bash
code --list-extensions
```

Install extensions

```bash
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
