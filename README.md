# dotfiles
my dotfiles

必要なもの
- wezterm
- starship

1. weztermを最新にしておく
2. nixとvimを先にクローンしておく
3. このリポジトリをクローン
4. doomemacsをインストールしてお

## Doomemacs のインストール
```zsh
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app
```

```zsh
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```
