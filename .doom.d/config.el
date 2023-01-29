;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(if (eq system-type 'gnu/linux)
(setq org_notes (concat (getenv "HOME") "/Documents/org/")
      zot_bib (concat (getenv "HOME") "/GDrive/zotero/zotLib.bib")))

(setq user-full-name "Jason Vlajankov"
      user-mail-address "jvlaj@protonmail.com")

(setq doom-font (font-spec :family "Iosevka Term SS14" :size 18)
      doom-variable-pitch-font (font-spec :family "ETBookOT" :size 20 :height 1)
      doom-big-font (font-spec :family "Iosevka Term SS14" :size 30))
(after! doom-themes
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic)
  '(org-table :inherit 'doom-font))

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

(setq +latex-viewers '(zathura))

(setq evil-respect-visual-line-mode t)

(set-file-template! "/project\\.org$" :trigger "__project.org" :mode 'org-mode)

(setq org-src-window-setup 'current-window)

(setq org-latex-listings 't)

(setq org-hugo-export-with-toc 'nil)
(setq org-hugo-auto-set-lastmod 't)

(setq
 org-directory org_notes
 citar-bibliography zot_bib
 citar-library-paths '("~/snap/zotero-snap/common/Zotero/storage/")
 citar-notes-paths (list org_notes)
 deft-directory org_notes
 org-roam-directory org_notes)

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

(setq org-startup-truncated 'nil)

(setq company-show-numbers t)

;; apa6
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
  (setq org-hide-emphasis-markers t))
  

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(with-eval-after-load 'org
    (setq org-directory "~/Documents/org"))

(setq org-latex-listings-options '(("breaklines" "true")))
(setq org-ditaa-jar-path "/usr/bin/ditaa")
