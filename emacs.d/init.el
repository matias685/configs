;; Remove bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1) 
(setq-default c-basic-offset 4)
(pixel-scroll-precision-mode)
;; Open dashboard when using emacsclient
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(setq help-window-select t)  ; Switch to help buffers automatically

;; disable scroll bar on new emacsclient frames
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)


;; Show file name in title
(setq frame-title-format
      `((buffer-file-name "%f" "%b")
        ,(format " - GNU Emacs %s" emacs-version)))
(setq dired-listing-switches "--group-directories-first -alh")

;; Set the first day of the week to Monday
(setq calendar-week-start-day 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)
(setq ad-redefinition-action 'accept)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq completion-cycle-threshold t)
(setq make-backup-files nil) ; stop creating ~ files

;; Focus on the new frame
(defadvice split-window (after split-window-after activate)
  (other-window 1))

;; Default font
(add-to-list 'default-frame-alist
             '(font . "Iosevka 11"))

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
   '("c414f69a02b719fb9867b41915cb49c853489930be280ce81385ff7b327b4bf6" "02fff7eedb18d38b8fd09a419c579570673840672da45b77fde401d8708dc6b5" "e27c391095dcee30face81de5c8354afb2fbe69143e1129109a16d17871fc055" "795d2a48b56beaa6a811bcf6aad9551878324f81f66cac964f699871491710fa" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" default))
 '(elfeed-goodies/entry-pane-position 'bottom)
 '(elfeed-goodies/entry-pane-size 0.6)
 '(elfeed-goodies/feed-source-column-width 50)
 '(elfeed-goodies/powerline-default-separator 'bar)
 '(elfeed-goodies/tag-column-width 20)
 '(package-selected-packages
   '(vterm sudo-edit beacon elfeed-goodies elfeed vertico orderless pulsar centered-window org-tree-slide marginalia org-bullets magit modus-themes use-package rainbow-mode org doom-modeline dashboard))
 '(warning-suppress-types '((comp))))
;; '(pulsar-pulse-functions
;;   '(isearch-repeat-forward isearch-repeat-backward recenter-top-bottom move-to-window-line-top-bottom reposition-window other-window delete-window delete-other-windows forward-page backward-page scroll-up-command scroll-down-command windmove-right windmove-left windmove-up windmove-down windmove-swap-states-right windmove-swap-states-left windmove-swap-states-up windmove-swap-states-down tab-new tab-close tab-next org-next-visible-heading org-previous-visible-heading org-forward-heading-same-level org-backward-heading-same-level outline-backward-same-level outline-forward-same-level outline-next-visible-heading outline-previous-visible-heading outline-up-heading)))

;; Org-presentation
(require 'org-tree-slide)
(with-eval-after-load "org-tree-slide"
  (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
  (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree)
  )
(global-set-key (kbd "<f8>") 'org-tree-slide-mode)
(global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)

;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))
  (setq dashboard-set-footer t)
(when (display-graphic-p)
  (require 'all-the-icons))
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode -1))
(use-package modus-themes
  :config
  (load-theme 'modus-operandi t))

;; emoji
;;(use-package emojify
;;  :hook (after-init . global-emojify-mode))

;; org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Vertico autocomplete
(use-package vertico
  :init
  (vertico-mode))

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

;; Orderless completion
(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless)))

;; Pulsar package
;;(require 'pulsar)
;;(pulsar-setup)
;;(customize-set-variable
;; 'pulsar-pulse-functions
;; '(isearch-repeat-forward
;;   isearch-repeat-backward
;;   recenter-top-bottom
;;   move-to-window-line-top-bottom
;;   reposition-window
;;   other-window
;;   delete-window
;;   delete-other-windows
;;   forward-page
;;   backward-page
;;   scroll-up-command
;;   scroll-down-command
;;   windmove-right
;;   windmove-left
;;   windmove-up
;;   windmove-down
;;   windmove-swap-states-right
;;   windmove-swap-states-left
;;   windmove-swap-states-up
;;   windmove-swap-states-down
;;   tab-new
;;   tab-close
;;   tab-next
;;   org-next-visible-heading
;;   org-previous-visible-heading
;;   org-forward-heading-same-level
;;   org-backward-heading-same-level
;;   outline-backward-same-level
;;   outline-forward-same-level
;;   outline-next-visible-heading
;;   outline-previous-visible-heading
;;   outline-up-heading))
;;(setq pulsar-pulse t)
;;(setq pulsar-delay 0.055)
;;(setq pulsar-face 'pulsar-cyan)
;;
;;(let ((map global-map))
;;  (define-key map (kbd "C-x l") 'pulsar-pulse-line))
(beacon-mode 1)
(setq beacon-push-mark 70)
(setq beacon-color "#00FFFF")
(let ((map global-map))
  (define-key map (kbd "C-x l") #'beacon-blink))
;; RSS reader
  (use-package elfeed
    :ensure t
    :config
    (setq elfeed-db-directory (expand-file-name "elfeed" user-emacs-directory))
    (setq-default elfeed-search-filter "@2-week-ago")
    :bind
    ("C-x w" . elfeed ))
(setq elfeed-feeds
      '(("https://archlinux.org/feeds/news/" linux)
	("https://www.reddit.com/r/linux.rss" linux reddit)
        ("https://www.sachachua.com/blog/feed" emacs)
        ("https://www.reddit.com/r/emacs.rss" emacs reddit)
	("https://www.reddit.com/r/CommunismMemes.rss" memes reddit)
	("https://xkcd.com/rss.xml" comics)
	("https://www.debian.org/security/dsa" linux debian security)
	("https://lwn.net/headlines/rss" linux)
	("https://thisweek.gnome.org/index.xmlw" linux)))
(use-package elfeed-goodies
  :ensure t
  :config
  (elfeed-goodies/setup))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
