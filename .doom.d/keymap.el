;;; keymap.el -*- lexical-binding: t; -*-
;;;
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
