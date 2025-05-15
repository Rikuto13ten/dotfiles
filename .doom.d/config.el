;; メインフォント
(setq doom-font (font-spec :family "Iosevka Custom Rikuto Code"
                           :size 14
                           :weight 'Regular
                           :widthtype 'extended))

;; 固定幅フォント
(setq doom-variable-pitch-font (font-spec :family "PlemolJP"
                                          :size 14))
(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")

(load! "config/org-setting.el")

;; vim
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; desktop-save-modeの有効化
(after! desktop
  ;; 保存する情報の設定
  (setq desktop-path '("~/.emacs.d/.desktop")
        desktop-auto-save-timeout 30) ; 5分ごとに自動保存

  (desktop-save-mode 1))

;; Emacs終了時にデスクトップセッションを保存するよう設定
(add-hook 'kill-emacs-hook
          (lambda ()
            (desktop-save "~/.emacs.d/.desktop" t)))

;; Emacs起動時にデスクトップセッションを復元する
(add-hook 'emacs-startup-hook #'desktop-read nil t)
(setq desktop-restore-eager 5) ; 最初の5つのバッファを即座に読み込み、残りは遅延読み込み

;; Ace Jump Mode
(use-package ace-jump-mode
  :ensure t
  :bind (("C-c j" . ace-jump-mode)))


;; terminal で emacs を開いているときに、
;; if insert mode {  -> 󰗧 }
(use-package! evil-terminal-cursor-changer
  :hook (tty-setup . evil-terminal-cursor-changer-activate))

;; <Space> + Key の設定
(map! :leader
      ;; ウィンドウ移動
      :desc "ウィンドウ左へ移動" "h" #'evil-window-left
      :desc "ウィンドウ下へ移動" "j" #'evil-window-bottom
      :desc "ウィンドウ上へ移動" "k" #'evil-window-top
      :desc "ウィンドウ右へ移動" "l" #'evil-window-right

      ;; Neotreeの操作
      :desc "Neotreeでディレクトリを開く" "f e" #'neotree-dir
      :desc "Neotreeの表示切替" "e"   #'neotree-toggle)

(require 'whitespace)
(global-whitespace-mode 1)

;; 表示したい空白の種類を設定
(setq whitespace-style '(face           ; 以下で指定した空白に色をつける
                         spaces         ; スペース
                         tabs           ; タブ
                         trailing       ; 行末の空白
                         empty          ; 先頭/末尾の空行
                         space-mark     ; スペースの記号表示
                         tab-mark       ; タブの記号表示
                         ))

;; 空白文字の表示方法を設定
(setq whitespace-display-mappings
      '((space-mark ?\u0020 [?\u00B7] [?.]) ; スペースを中黒点で表示
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t]))) ; タブを "»" で表示
