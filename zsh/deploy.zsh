# ファイルのリスト
dotfiles=(.zshrc .wezterm.lua)

# フォルダのリスト
dotdirs=(.doom.d)

# ファイルのシンボリックリンクを作成
for file in "${dotfiles[@]}"; do
  ln -svf ~/dotfiles/${file} ~/${file}
done

# starship.tomlのシンボリックリンク
ln -svf ~/dotfiles/starship.toml ~/.config/starship.toml

# フォルダのシンボリックリンクを作成
for dir in "${dotdirs[@]}"; do
  # 目的のディレクトリが存在しない場合は作成する
  ln -svf ~/dotfiles/${dir} ~/${dir}
done
