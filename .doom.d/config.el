;;; メインフォント
(setq doom-font (font-spec :family "Iosevka Custom Rikuto Code"
                           :size 14
                           :weight 'Regular
                           :widthtype 'extended))

;;; 固定幅フォント
(setq doom-variable-pitch-font (font-spec :family "PlemolJP"
                                          :size 14))
;;; theme
(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)

;;; org directory
(setq org-directory "~/org/")

;;; load org setting
(load! "config/org-setting.el")

;;; vim
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;;; desktop-save-modeの有効化
(after! desktop
  ;; 保存する情報の設定
  (setq desktop-path '("~/.emacs.d/.desktop")
        desktop-auto-save-timeout 30) ; 5分ごとに自動保存

  (desktop-save-mode 1))

;;; Emacs終了時にデスクトップセッションを保存するよう設定
(add-hook 'kill-emacs-hook
          (lambda ()
            (desktop-save "~/.emacs.d/.desktop" t)))

;;; Emacs起動時にデスクトップセッションを復元する
(add-hook 'emacs-startup-hook #'desktop-read nil t)
(setq desktop-restore-eager 5) ; 最初の5つのバッファを即座に読み込み、残りは遅延読み込み

;;; Ace Jump Mode
(use-package ace-jump-mode
  :ensure t
  :bind (("C-c j" . ace-jump-mode)))


;;; terminal で emacs を開いているときに、
;; if insert mode {  -> 󰗧 }
(use-package! evil-terminal-cursor-changer
  :hook (tty-setup . evil-terminal-cursor-changer-activate))

;;; <Space> + Key の設定
(map! :leader
      ;; ウィンドウ移動
      :desc "ウィンドウ左へ移動" "h" #'evil-window-left
      :desc "ウィンドウ下へ移動" "j" #'evil-window-bottom
      :desc "ウィンドウ上へ移動" "k" #'evil-window-top
      :desc "ウィンドウ右へ移動" "l" #'evil-window-right

      ;; Neotreeの操作
      :desc "Neotreeでディレクトリを開く" "f e" #'neotree-dir
      :desc "Neotreeの表示切替" "e"   #'neotree-toggle)

;;; whitespace
(require 'whitespace)
(global-whitespace-mode 1)

;;; 表示したい空白の種類を設定
(setq whitespace-style
      '(face           ; 以下で指定した空白に色をつける
        spaces         ; スペース
        tabs           ; タブ
        trailing       ; 行末の空白
        empty          ; 先頭/末尾の空行
        space-mark     ; スペースの記号表示
        tab-mark       ; タブの記号表示
        ))

;;; outline
;;;; 見出しを変える
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("^;;;\\([;]*\\) \\(.*\\)$"
                           (2 '(:inherit org-level-1 :height 1) t))
                          ("^;;;;\\([;]*\\) \\(.*\\)$"
                           (2 '(:inherit org-level-2 :height 1) t))
                          ("^;;;;;\\([;]*\\) \\(.*\\)$"
                           (2 '(:inherit org-level-3 :height 1) t))
                          ("^;;;;;;\\([;]*\\) \\(.*\\)$"
                           (2 '(:inherit org-level-4) t))))

;;;; outline-minor-modeでTABキーを使って開閉する設定
(defun my-outline-minor-mode-setup ()
  "Set up outline-minor-mode to use TAB for folding/unfolding."
  ;; TABキーで開閉
  (local-set-key (kbd "<tab>") 'my-outline-toggle)

  ;; S-TAB（シフト+タブ）ですべての見出しの開閉を切り替え
  (local-set-key (kbd "<backtab>") 'my-outline-toggle-all))

;; 現在位置の見出しを開閉するための関数
(defun my-outline-toggle ()
  "Toggle outline visibility at point."
  (interactive)
  (if (outline-on-heading-p)
      (cond ((outline-invisible-p (line-end-position))
             (outline-show-subtree))
            (t (outline-hide-subtree)))
    (if (or (bolp) (outline-invisible-p (line-end-position)))
        (outline-show-entry)
      (outline-hide-entry))))

;; すべての見出しの開閉を切り替える関数
(defun my-outline-toggle-all ()
  "Toggle all outline visibility."
  (interactive)
  (if (outline-invisible-p (line-end-position))
      (outline-show-all)
    (outline-hide-body)))

;;;; outline-modeの設定
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            ;; outline-modeを有効化
            (outline-minor-mode 1)
            ;; Emacs Lisp用の見出しレベルを設定
            (setq outline-regexp ";;;\\(;*\\)")
            ;; ファイルを開いたときに自動的にすべて折りたたむ
            (outline-hide-body)
            ;; TABキーの設定を有効化
            (my-outline-minor-mode-setup)))

;;; 空白文字の表示方法を設定
(setq whitespace-display-mappings
      '((space-mark ?\u0020 [?\u00B7] [?.]) ; スペースを中黒点で表示
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t]))) ; タブを "»" で表示

