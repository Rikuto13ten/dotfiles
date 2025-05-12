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

(use-package ob-d2
  :ensure t)

(use-package org
  :after ob-d2
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((d2 . t))))

;; appear
(setq org-appear-trigger 'manual)
(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'evil-insert-state-entry-hook
                                     #'org-appear-manual-start
                                     nil
                                     t)
                           (add-hook 'evil-insert-state-exit-hook
                                     #'org-appear-manual-stop
                                     nil
                                     t)))
