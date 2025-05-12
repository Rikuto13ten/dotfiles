# Android SDKのplatform-toolsのパスを追加
export PATH="$PATH":"$HOME/Library/Android/sdk/platform-tools"

# Nixパッケージマネージャーのバイナリパスを追加
export PATH="/Users/usr/.nix-profile/bin:$PATH"

# SKK 用
export PATH="$HOME/yaskkserv2/target/release:$PATH"

# Homebrew のパスを通す
eval "$(/opt/homebrew/bin/brew shellenv)"

export DOOMDIR="$HOME/dotfiles/.doom.d"
