;;; resize-frame.el --- A minor mode to resize frames easily.  -*- lexical-binding: t; -*-
;https://emacs.stackexchange.com/questions/582/how-to-change-size-of-split-screen-emacs-windows
;; Copyright (C) 2014  kuanyui

;; Author: kuanyui <azazabc123@gmail.com>
;; Keywords: frames, tools, convenience
;; License: WTFPL 1.0

;;; Commentary:

;; Press "ESC `" and use arrow-keys or i/j/k/l to adjust frames. press any key to done.

;;; Code:

(defvar resize-frame-map
  (let ((map (make-keymap)))
    (define-key map (kbd "<up>") 'enlarge-window)
    (define-key map (kbd "<down>") 'shrink-window)
    (define-key map (kbd "<right>") 'enlarge-window-horizontally)
    (define-key map (kbd "<left>") 'shrink-window-horizontally)
    (set-char-table-range (nth 1 map) t 'resize-frame-done)
    (define-key map (kbd "C-p") 'enlarge-window)
    (define-key map (kbd "C-n") 'shrink-window)
    (define-key map (kbd "C-f") 'enlarge-window-horizontally)
    (define-key map (kbd "C-b") 'shrink-window-horizontally)
    map))

(define-minor-mode resize-frame
  "A simple minor mode to resize-frame.
C-c C-c to apply."
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " ResizeFrame"
  ;; The minor mode bindings.
  :keymap resize-frame-map
  :global t
  (if (<= (length (window-list)) 1)
      (progn (setq resize-frame nil)
             (message "Only root frame exists, abort."))
      (message "Use arrow-keys or i/j/k/l to adjust frames.")))

(defun resize-frame-done ()
  (interactive)
  (setq resize-frame nil)
  (message "Done."))

(global-set-key (kbd "ESC `") 'resize-frame)

(provide 'resize-frame)
;;; resize-frame.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(beacon-color "#cc6666")
 '(fci-rule-color "#383838")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(sublime-themes default-text-scale color-theme-sanityinc-tomorrow helm-lsp quickrun company-bootstrap doom-modeline multiple-cursors flymd company-box company-quickhelp mode-icons yasnippet-snippets which-key web-mode use-package rainbow-delimiters projectile nyan-mode neotree magit lsp-java langtool kaolin-themes impatient-mode highlight-numbers highlight-escape-sequences helm google-translate flycheck exec-path-from-shell emmet-mode eglot dumb-jump doom-themes define-word dashboard counsel company-web company-c-headers all-the-icons ac-html-csswatcher ac-html ac-clang ac-capf ac-c-headers))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(window-divider-mode nil))


