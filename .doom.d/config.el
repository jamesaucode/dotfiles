;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "James Au"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font Mono" :size 20))

(setq doom-theme 'doom-tomorrow-night)

;; Always use ~/org just to be consistent, symlink it to ~/org if it's somewhere else
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/captured.org"))

;; Relative line numbers for easier navigation with evil
(setq display-line-numbers-type 'relative)

;; Faster autocomplete
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0.05)
(setq gc-cons-threshold 10000000)
;; VS-code like tab completion behavior
(company-tng-configure-default)

;; Adds time log when tasks are set to DONE
(setq org-log-done 'time)
(setq org-agenda-start-with-log-mode t)

;; Auto run prettier on save for JS and TS files
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'org-mode-hook 'writeroom-mode)
;; Some performance enhancement for magit
;; (setq magit-git-executable "/usr/local/bin/git")
(setq vc-handled-backends nil)
(setq vc-handled-backends (delq 'Git vc-handled-backends))
(setq magit-auto-revert-mode nil)
(setq global-auto-revert-mode nil)

;; Transparent background
(set-frame-parameter (selected-frame) 'alpha '(92 . 90))
(add-to-list 'default-frame-alist '(alpha . (92 . 90)))

;; Vim like keybinding for navigating through hunks
(map! :desc "Next hunk" :nv "SPC g j" #'git-gutter:next-hunk)
(map! :desc "Previous hunk" :nv "SPC g k" #'git-gutter:previous-hunk)

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
