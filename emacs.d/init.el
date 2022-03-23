(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1) 
;; Case insensitive completion
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq completion-cycle-threshold t)
(setq make-backup-files nil) ; stop creating ~ files
;; interactive mode
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(ido-grid-mode 1)
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
   '("0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" default))
 '(package-selected-packages
   '(ido-grid-mode use-package rainbow-mode org kaolin-themes evil emojify doom-themes doom-modeline dashboard)))
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))
(when (display-graphic-p)
  (require 'all-the-icons))
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(require 'evil)
(evil-mode 1)
;;(use-package doom-themes
;;	     :ensure t
;;	     :config
;;	     (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;              doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;	     (load-theme 'doom-vibrant))
(use-package kaolin-themes
  :config
  (load-theme 'kaolin-aurora t)
  (kaolin-treemacs-theme))
(use-package emojify
  :hook (after-init . global-emojify-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
