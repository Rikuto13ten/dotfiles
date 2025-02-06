alias vi='nvim'
alias vicnf='cd ~/.config/nvim && nvim init.lua'
alias vinix='cd ~/nix-flake && nvim flake.nix'
alias vizsh='cd ~/dotfiles && vi ~/dotfiles/.zshrc'
alias viwez='cd ~/dotfiles && vi .wezterm.lua'
alias ls='eza -l -a --icons=always -s type'
alias c='clear'

function gitimpl() {
  git config --global user.name "noda.r@impl.co.jp"
  git config --global user.email "Rikuto13impl"
  source ~/.zshrc
}

function gitrg() {
  git config --global user.name "rikuto1367@gmail.com"
  git config --global user.email "Rikuto13ten"
  source ~/.zshrc
}

function gitrl() {
  git config --global user.name "rikuto1367@gmail.com"
  git config --global user.email "Rikuto13ten"
  source ~/.zshrc
}

function gitstatus() {
  git config user.name
  git config user.email
  source ~/.zshrc
}
