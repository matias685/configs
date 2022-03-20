(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1) 
(global-display-line-numbers-mode 1)
(add-to-list 'default-frame-alist
             '(font . "Iosevka 12"))
;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" default))
 '(package-selected-packages '(doom-themes doom-modeline dashboard)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))
;; Set the banner
;;(setq dashboard-startup-banner [official])
(when (display-graphic-p)
  (require 'all-the-icons))
(require 'doom-modeline)
(doom-modeline-mode 1)
(use-package doom-themes
	     :ensure t
	     :config
	     (load-theme 'doom-vibrant))
