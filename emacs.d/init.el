;; package settings
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package)
(package-initialize)

;; remove bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

; disable bell sound
(setq ring-bell-function 'ignore)

; set indentation width to 4 spaces in c files
(setq-default c-basic-offset 4)
;(pixel-scroll-precision-mode)
; Open dashboard when using emacsclient
;(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

; set global keybdings
(global-set-key (kbd "C-x m") 'emms)
(global-set-key (kbd "C-/") 'undo)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<f9>") 'display-line-numbers-mode)
; Create a new line below current
(global-set-key (kbd "<C-return>") (lambda ()
                   (interactive)
                   (end-of-line)
                   (newline-and-indent)))
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)
(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)

(setq help-window-select t)  ; Switch to help buffers automatically
(when window-system (set-frame-size (selected-frame) 165 42)) ; Set default window size
; disable scroll bar on new emacsclient frames
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                            '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

; create closing paranthesis automatically
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

; Switch between keybindings with shift+arrow
(windmove-default-keybindings)
(setq windmove-wrap-around t)

; Show file name in title
(setq frame-title-format
      `((buffer-file-name "%b")))
;        ,(format " - GNU Emacs %s" emacs-version)))
;        ,(format " - GNU Emacs %s")))

;(setq dired-listing-switches "--group-directories-first -la")

; Set the first day of the week to Monday
(setq calendar-week-start-day 1)

; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)
(setq ad-redefinition-action 'accept)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq completion-cycle-threshold t)
(setq make-backup-file nil) ; stop creating ~ files
(setq auto-save-default nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil) ;; spaces instead of tabs
(setq-default standard-indent 4)
(setq c-basic-offset tab-width)
(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'nil)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

; Focus on the new frame
(defadvice split-window (after split-window-after activate)
  (other-window 1))

(setq Man-notify-method 'aggressive)

; Default font
(add-to-list 'default-frame-alist
             '(font . "Iosevka 12"))

;; change theme based on time
(setq calendar-location-name "Kouvola, FI") 
(setq calendar-latitude 60.86)
(setq calendar-longitude 26.70)
(require 'theme-changer)
(change-theme 'modus-operandi 'modus-vivendi)

; dired settings
(setq dired-recursive-deletes 'always)
(diredp-toggle-find-file-reuse-dir 1)
(use-package dired
  :hook (dired-mode . dired-hide-details-mode)
  :config
  ; Colourful columns.
  (use-package diredfl
    :ensure t
    :config
    (diredfl-global-mode 1)))
(use-package dired-subtree
  :ensure t
  :after dired
  :bind (:map dired-mode-map
              ("TAB" . dired-subtree-toggle)))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

; automatically show css colors
(use-package rainbow-mode
  :diminish
  :init
    (add-hook 'prog-mode-hook 'rainbow-mode))

; Dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-startup-banner 'official)
  (dashboard-setup-startup-hook))
  (setq dashboard-set-footer t)
(when (display-graphic-p)
  (require 'all-the-icons))
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 0))
(use-package modus-themes)

; EMMS basic configuration
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music/") ;; Change to your music folder
; Choose one of these
(setq emms-info-functions '(emms-info-tinytag))  ;; When using Tinytag
;(setq emms-info-functions '(emms-info-exiftool)) When using Exiftool
(setq emms-browser-covers 'emms-browser-cache-thumbnail-async)

; org settings
(setq org-ellipsis " ")
 (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
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
    ("httpns://www.reddit.com/r/emacs.rss" emacs reddit)
	("https://www.reddit.com/r/CommunismMemes.rss" memes reddit)
	("https://xkcd.com/rss.xml" comics)
	("https://lwn.net/headlines/rss" linux)
    ( "https://www.phoronix.com/phoronix-rss.php" tech linux)
	("https://www.omgubuntu.co.uk/feed" linux)
	("https://thisweek.gnome.org/index.xmlw" linux)))
(use-package elfeed-goodies
  :ensure t
  :config
  (elfeed-goodies/setup))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("dad40020beea412623b04507a4c185079bff4dcea20a93d8f8451acb6afc8358" "a0415d8fc6aeec455376f0cbcc1bee5f8c408295d1c2b9a1336db6947b89dd98" "e0628ee6c594bc7a29bedc5c57f0f56f28c5b5deaa1bc60fc8bd4bb4106ebfda" "c414f69a02b719fb9867b41915cb49c853489930be280ce81385ff7b327b4bf6" "02fff7eedb18d38b8fd09a419c579570673840672da45b77fde401d8708dc6b5" "e27c391095dcee30face81de5c8354afb2fbe69143e1129109a16d17871fc055" "795d2a48b56beaa6a811bcf6aad9551878324f81f66cac964f699871491710fa" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" default))
 '(elfeed-goodies/entry-pane-position 'bottom)
 '(elfeed-goodies/entry-pane-size 0.6)
 '(elfeed-goodies/feed-source-column-width 50)
 '(elfeed-goodies/powerline-default-separator 'bar)
 '(elfeed-goodies/tag-column-width 20)
 '(org-table-shrunk-column-indicator nil)
 '(package-selected-packages
   '(emms dired-subtree dired+ diredfl all-the-icons-dired vterm sudo-edit elfeed-goodies elfeed vertico orderless centered-window org-tree-slide marginalia org-bullets magit modus-themes use-package rainbow-mode org doom-modeline dashboard))
 '(warning-suppress-types '((comp))))
;; '(pulsar-pulse-functions
;;   '(isearch-repeat-forward isearch-repeat-backward recenter-top-bottom move-to-window-line-top-bottom reposition-window other-window delete-window delete-other-windows forward-page backward-page scroll-up-command scroll-down-command windmove-right windmove-left windmove-up windmove-down windmove-swap-states-right windmove-swap-states-left windmove-swap-states-up windmove-swap-states-down tab-new tab-close tab-next org-next-visible-heading org-previous-visible-heading org-forward-heading-same-level org-backward-heading-same-level outline-backward-same-level outline-forward-same-level outline-next-visible-heading outline-previous-visible-heading outline-up-heading)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
