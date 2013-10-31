;;(warn "Loading .emacs")
(setq debug-on-error t)

;;*********************

(show-paren-mode t)
(column-number-mode t)
(delete-selection-mode t)

;; Show all line numbering by default
(global-linum-mode t)
;; Adjust line number spacing in gutter
(setq linum-format " %d  ")

;; highlight current line
(global-hl-line-mode t)

;;*********************

(setq default-fill-column 80)

;;*********************

;; To get rid of Weird color escape sequences in Emacs.
;; Instruct Emacs to use emacs term-info not system term info
;; http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal
(setq system-uses-terminfo nil)

;;*********************

;; Remove splash screen
(setq inhibit-splash-screen t)
;; setup splash screen img
;;'(fancy-splash-image "/home/ryu/shufei2.png")

;;*********************

;; Use ibuffer to List Buffers
(defalias 'list-buffers 'ibuffer)

;; make buffer switch command show suggestions on minibuffer 
(ido-mode 1)

;;*********************

;; Emacs backups!
(setq backup-directory-alist `(("." . "~/.emacs.d/.backups")))
;; how Emacs might create your backup files --> always make backups by copying
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Disable backups
;; (setq backup-inhibited t)

;;disable auto save
(setq auto-save-default nil)

;;*********************

;; Prefer utf-8 encoding
(prefer-coding-system 'utf-8)

;;*********************

;; Do not use tabs for indentation
(setq-default indent-tabs-mode nil)

;; 2 spaces indenation
(setq-default tab-width 2)

;;*********************

;; Display menu bar (File, Edit, etc.)
(menu-bar-mode t)

;;*********************

(setq inhibit-startup-message t)

;;*********************

;; Change cursor shape
(setq cursor-type 'box)
(setq cursor-type 'bar)

(blink-cursor-mode t)

;; (set-cursor-color "black")

(setq default-frame-alist
      '((cursor-color . "red")))

;;*********************

(global-visual-line-mode 1)

;;*********************

;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)

;;*********************

;; Font settings
(set-face-attribute 'default nil :height 140) ;; font-size: 14px


;;*********************

(display-time)

;;*********************

;; Turn off mouse interface early in startup to avoid momentary
;; display
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;*********************

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

;;*********************

;; Ctags
(setq path-to-ctags "/usr/local/bin/ctags") ;; <- you're ctags path here

;;*********************

;; Load color theme
(load-theme 'soft-morning t)

;;*********************

;; Activate enclose mode
(enclose-global-mode t)

;;*********************

;; Save partial status of Emacs when killed
(desktop-save-mode 1)

;;*********************
