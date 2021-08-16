
(setq inhibit-startup-message t)

(scroll-bar-mode -1)		; disable visible scrollbar
(tool-bar-mode -1)			; disable the toolbar
(tooltip-mode -1)			; disable tooltips
(set-fringe-mode 10)

(menu-bar-mode -1)			;disable menu bar


(setq visible-bell t)		; visual bell

(setq completion-styles '(flex))

(set-face-attribute 'default nil :font "SF Mono" :height 120)

(load-theme 'wombat)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; straight package manager

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
(load bootstrap-file nil 'nomessage))

; packages
(straight-use-package 'helm)
(straight-use-package 'evil)
(straight-use-package 'undo-tree)
(straight-use-package 'undo-fu)

; helm

(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)

; evil
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
