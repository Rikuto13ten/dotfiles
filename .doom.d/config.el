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

;; 見出しごとの、font size と color を設定
(after! org
  (setq org-startup-folded t)
  (set-face-attribute 'org-level-7 nil :weight 'bold :inherit 'default)
  (set-face-attribute 'org-level-6 nil :inherit 'org-level-7 :foreground "#F6CBE6")
  (set-face-attribute 'org-level-5 nil :inherit 'org-level-7 :foreground "#E1D4F9")
  (set-face-attribute 'org-level-4 nil :inherit 'org-level-7 :foreground "#F5ACD3")
  (set-face-attribute 'org-level-3 nil :inherit 'org-level-7 :height 1.2 :foreground "#C9BEF1") ;\large
  (set-face-attribute 'org-level-2 nil :inherit 'org-level-7 :height 1.44 :foreground "#B798F1") ;\Large
  (set-face-attribute 'org-level-1 nil :inherit 'org-level-7 :height 1.728 :foreground "#E883C7") ;\LARGE
 )

;; auto start org-superstar
;; 見出しのアイコン設定
(use-package org-bullets
  :custom (org-bullets-bullet-list '("" "󰎦" "󰎩" "󰎬" "󰎮" "󰎰" "󰎵" "󰎸" "󰎻" "󰎾"))
  :hook (org-mode . org-bullets-mode))

;; vim
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(with-eval-after-load 'org
  (custom-set-faces
   '(org-tag ((t (:background "#492F64" :foreground "white"))))))

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
