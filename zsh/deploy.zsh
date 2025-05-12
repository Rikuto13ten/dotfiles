# ファイルのリスト
dotfiles=(.zshrc .wezterm.lua)

# フォルダのリスト
<<<<<<< Updated upstream
dotdirs=(.doom.d)
=======
dotdirs=(.emacs.d)
>>>>>>> Stashed changes

# ファイルのシンボリックリンクを作成
for file in "${dotfiles[@]}"; do
  ln -svf ~/dotfiles/${file} ~/${file}
done

# starship.tomlのシンボリックリンク
ln -svf ~/dotfiles/starship.toml ~/.config/starship.toml

# フォルダのシンボリックリンクを作成
for dir in "${dotdirs[@]}"; do
   # 既存のシンボリックリンクやディレクトリが存在する場合は削除
   if [ -L ~/${dir} ] || [ -d ~/${dir} ]; then
      rm -rf ~/${dir}
   fi
   
   # シンボリックリンクを作成
   ln -svf ~/dotfiles/${dir} ~/${dir}
done
