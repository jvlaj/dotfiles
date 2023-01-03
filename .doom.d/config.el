;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; MACOS
(if (eq system-type 'darwin)
(setq org_notes (concat (getenv "HOME") "/Documents/org/") zot_bib (concat (getenv "HOME") "/Google\ Drive/My\ Drive/zotero/zotLib.bib") ispell-program-name "/opt/homebrew/bin/hunspell" ispell-hunspell-dict-paths-alist '("en_AU" (concat (getenv "HOME") "/Library/Spelling/en_AU.aff")))
(eq system-type 'gnu/linux)
(setq org_notes (concat (getenv "HOME") "/Documents/org/") zot_bib (concat (getenv "HOME") "/GDrive/zotero/zotLib.bib") ispell-program-name "/bin/hunspell" ispell-hunspell-dict-paths-alist '(("en_AU" "/usr/share/hunspell/en_AU.aff")("en_AU-large" "/usr/share/hunspell/en_AU-large.aff")))
)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jason Vlajankov"
      user-mail-address "jvlaj@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
(setq doom-font (font-spec :family "Iosevka" :size 18)
      doom-variable-pitch-font (font-spec :family "ETBookOT-Roman" :size 20 :height 1)
      doom-big-font (font-spec :family "Iosevka" :size 30))
(after! doom-themes
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic)
  '(org-table :inherit 'doom-font)
  )


(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (after! company
;;   (define-key company-active-map (kbd "<tab>") 'company-complete)
;; )

;; fix dictionary
(setq ispell-local-dictionary "en_AU")
(setq ispell-dictionary "en_AU")
(setenv "DICPATH" "/usr/share/myspell")

;; set pdf viewer
(setq +latex-viewers '(zathura))

;; visual lines (in init.el)
(setq evil-respect-visual-line-mode t)


;; file templates
(set-file-template! "/project\\.org$" :trigger "__project.org" :mode 'org-mode)

;; structure template
;;(add-to-list 'org-structure-template-alist'("r" "src R :exports both :results graphics :file ./fig_1?.png\n\n" "<src lang=\"?\">\n\n</src>"))

;; set our src code edit buffer to same window
(setq org-src-window-setup 'current-window)

;;Org settings
(setq org-latex-listings 't)

  ;; (setq org-latex-listings-options
  ;;   '(("basicstyle" " \\small ")
  ;;     ("keywordstyle" " \\color{black} \\bfseries \\underbar ")
  ;;   ("commentstyle" "\\color{red}")
  ;;  ))

;; hugo settings
(setq org-hugo-export-with-toc 'nil)
(setq org-hugo-auto-set-lastmod 't)

;; org-note-workflow
(setq
 org-directory org_notes
 citar-bibliography zot_bib
 citar-library-paths '("~/snap/zotero-snap/common/Zotero/storage/")
 citar-notes-paths (list org_notes)
 deft-directory org_notes
 org-roam-directory org_notes
)

(after! citar
  (setq citar-symbols
        `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
          (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
          (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
  (setq citar-symbol-separator "  ")
  (setq citar-citeproc-csl-styles-dir "/home/jvlaj/csl")
  (map! :leader :prefix "n"
        "b" #'citar-insert-citation))

(setq citar-filenotify-callback 'refresh-cache)

;; (setq org-noter-default-notes-file-names )
(setq org-startup-truncated 'nil)

;; tabnine
(add-to-list 'company-backends #'company-tabnine)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Set up org-mode export stuff (apa6)
(with-eval-after-load 'ox-latex
        (add-to-list 'org-latex-classes
                '("apa6"
                        "\\documentclass{apa6}"
                        ("\\section{%s}" . "\\section*{%s}")
                        ("\\subsection{%s}" . "\\subsection*{%s}")
                        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                        ("\\paragraph{%s}" . "\\paragraph*{%s}")
                        ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(after! org
  (setq org-special-ctrl-a/e t)
  (setq org-special-ctrl-k t))

(add-hook! org-mode :append #'org-appear-mode)

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))
  (add-hook 'org-mode-hook (lambda () (linum-mode 0)))
  (add-hook 'org-mode-hook (lambda () (company-mode 0)))
  (setq org-hide-emphasis-markers t)
  )

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                        (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(with-eval-after-load 'org
    (setq org-directory "~/Documents/org"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((gprolog . t)))

(setq org-latex-listings-options '(("breaklines" "true")))
(setq org-ditaa-jar-path "/usr/bin/ditaa")
