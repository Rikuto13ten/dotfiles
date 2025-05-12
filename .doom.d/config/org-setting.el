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

;; 強調マーカーを非表示にする(* や /)
(setq org-hide-emphasis-markers t)

;; 斜体用のカスタムフェイスを定義
(defface my-org-emphasis-italic
  '((default :inherit italic)
    (((class color) (min-colors 88) (background light))
     :foreground "#D1EBF9")  ;; 明るい背景用の緑色
    (((class color) (min-colors 88) (background dark))
     :foreground "#26a7ed")) ;; 暗い背景用の緑色
  "Orgモードでの斜体用カスタムフェイス")

(setq org-emphasis-alist
      '(("*" my-org-emphasis-bold)
        ("/" my-org-emphasis-italic)
        ("_" underline)
        ("=" org-verbatim verbatim)
        ("~" org-code verbatim)
        ("+" (:strike-through t))))

(with-eval-after-load 'org
  (custom-set-faces
   '(org-tag ((t (:background "#492F64" :foreground "white"))))))
