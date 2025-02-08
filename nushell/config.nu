# Nushell Config File
#
# version = "0.100.0"

# The default config record. This is where much of your global configuration is setup.
$env.config = {
  show_banner: false # true or false to enable or disable the welcome banner at startup

  keybindings: [
    {
      name: fuzzy_file
      modifier: control
      keycode: char_t
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: executehostcommand
        # NOTE: the following work with nushell as the default terminal
        # fzf previews without folder tree format
        # cmd: "commandline edit --replace (fzf --multi --preview='bat --style=numbers --color=always {}' )"
        # fzf previews with folder tree format
        # cmd: "commandline edit --replace (fzf --multi --preview='try {bat --style=numbers --color=always {}} catch {clear; eza --tree --color=always | head -200}' )"

        # NOTE: works with zsh as the default terminal
        # cmd: "commandline edit ((commandline) + (fzf --exact --multi --preview='if [ -d {} ]; then eza --tree --color=always {} | head -200; else if [[ (defaults read -globalDomain AppleInterfaceStyle) == 'Dark' ]]; then bat --theme='TokyonightStorm'-n --color=always --line-range :500 {} else bat --theme='CatppuccinLatte' -n --color=always --line-range :500 {}; fi; fi'))"
        cmd: """
        commandline edit (
          ( commandline ) +
          (
            fzf --exact --multi --preview='if [ -d {} ]; then
              eza --tree --color=always {} | head -200;
            else
              if [[ $(defaults read -globalDomain AppleInterfaceStyle 2> /dev/null) == "Dark" ]]; then
                bat --theme="TokyonightStorm" -n --color=always --line-range :500 {};
              else
                bat --theme="CatppuccinLatte" -n --color=always --line-range :500 {};
              fi
            fi'
          )
        )
        """
      }
    }
  ]
}

# ----- Bat (better cat) -----
alias cat = bat_with_dynamic_theme

# ---- Eza (better ls) -----
alias nuls = ls
alias ls = eza -a --color=always --git --icons=always --ignore-glob=".DS_Store"

# ---- LazyGit -----
alias lg = lazygit

# ---- Nvim (and old vi habbits) -----
alias v = vi
alias vi = nvim

# ---- Fzf (fuzzy find) -----
# NOTE: works with nushell as the default terminal
# alias fzf = fzf --multi --preview='try {bat --style=numbers --color=always {}} catch {clear; eza --tree --color=always | head -200}'
# NOTE: works with zsh as the default terminal
# alias fzf = fzf --exact --multi --preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else $fzf_bat_with_dynamic_theme {}; fi"

alias fzf = fzf --exact --multi --preview='if [ -d {} ]; then
    eza --tree --color=always {} | head -200;
  else
    if [[ $(defaults read -globalDomain AppleInterfaceStyle 2> /dev/null) == "Dark" ]]; then
      bat --theme="TokyonightStorm" -n --color=always --line-range :500 {};
    else
      bat --theme="CatppuccinLatte" -n --color=always --line-range :500 {};
    fi
  fi'


# ---- VS Code -----
alias code = /usr/local/bin/code

# ---- Yazi -----
alias y = yazi

source ./env.nu
source ~/.config/atuin/init.nu
source ~/.cache/carapace/init.nu
source ~/.zoxide.nu

use ~/.cache/starship/init.nu
