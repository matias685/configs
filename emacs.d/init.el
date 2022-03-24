;; Remove bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1) 
(setq next-line-add-newlines t)
(global-hl-line-mode 1)
;; Show file name in title
(setq frame-title-format
      `((buffer-file-name "%f" "%b")
        ,(format " - GNU Emacs %s" emacs-version)))
(setq dired-listing-switches "--group-directories-first -alh")
 ;; Case insensitive completion
;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)
(setq ad-redefinition-action 'accept)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq completion-cycle-threshold t)
(setq make-backup-files nil) ; stop creating ~ files
;; interactive mode
;;(ido-mode 1)
;;(setq ido-everywhere t)
;;(setq ido-enable-flex-matching t)
;;(setq ido-use-filename-at-point 'guess)
;;(ido-grid-mode 1)
;; Focus on the new frame
(defadvice split-window (after split-window-after activate)
  (other-window 1))
;; Enable line numbers
(global-display-line-numbers-mode 1)
;; Default font
(add-to-list 'default-frame-alist
             '(font . "Iosevka 12"))
(require 'use-package)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e27c391095dcee30face81de5c8354afb2fbe69143e1129109a16d17871fc055" "795d2a48b56beaa6a811bcf6aad9551878324f81f66cac964f699871491710fa" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" default))
 '(package-selected-packages
   '(helm modus-themes ido-grid-mode use-package rainbow-mode org emojify doom-modeline dashboard)))
3(use-package dashboard
  :ensure t
  :config
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))
  (setq dashboard-set-footer nil)
(when (display-graphic-p)
  (require 'all-the-icons))
;;(use-package doom-modeline
;;  :ensure t
;;  :init (doom-modeline-mode 1))
(use-package modus-themes
  :config
  (load-theme 'modus-operandi t))
(use-package emojify
  :hook (after-init . global-emojify-mode))
;; helm autocomplete
(require 'helm)
(setq-default helm-M-x-fuzzy-match t)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
