# 配置したい設定ファイル
dotfiles=(.zshrc .wezterm.lua)

# .zshrc と .tmux.conf という設定ファイルのシンボリックリンクを
# ホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
  ln -svf ~/dotfiles/${file} ~/${file}
done

ln -svf ~/dotfiles/starship.toml ~/.config/starship.toml
