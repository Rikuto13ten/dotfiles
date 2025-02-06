#==============================================================================
#
# 基本設定 / Basic Configuration
#
#==============================================================================
SCRIPT_DIR=$HOME/dotfiles

source $SCRIPT_DIR/zsh/export.zsh
source $SCRIPT_DIR/zsh/alias.zsh
source $SCRIPT_DIR/zsh/deploy.zsh

# gitプラグインを有効化
plugins=(git)

#==============================================================================
#
# シェル機能拡張 / Shell Enhancements
#
#==============================================================================

# Homebrewの補完機能の設定
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

# コマンドが見つからない場合のエラーハンドラ（赤色出力）
command_not_found_handler() {
    echo -e "\e[1;31mzsh: command not found: $@\e[0m"
    return 127
}

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
source $SCRIPT_DIR/zsh/plugin.zsh

#==============================================================================
#
# プロンプト設定 / Prompt Configuration
#
#==============================================================================

# Starshipプロンプトの初期化
eval "$(starship init zsh)"

export PROMPT="
%F{green}[%~]%f <`git config user.name`>
=> %# "
RPROMPT='%*'
