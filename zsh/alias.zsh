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

  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa

  git config user.name
  git config user.email

  ssh -T impl
}

function gitrg() {
  git config --global user.name "rikuto1367@gmail.com"
  git config --global user.email "Rikuto13ten"

  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519

  git config user.name
  git config user.email

  ssh -T rikuto
}

function gitrl() {
  git config --local user.name "rikuto1367@gmail.com"
  git config --local user.email "Rikuto13ten"

  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519

  git config user.name
  git config user.email

  ssh -T rikuto
}
