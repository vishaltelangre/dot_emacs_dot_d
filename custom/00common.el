;; Set the starting position and width and height of Emacs Window
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 175))

;; To get rid of Weird color escape sequences in Emacs.
;; Instruct Emacs to use emacs term-info not system term info
;; http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal
(setq system-uses-terminfo nil)

;; Prefer utf-8 encoding
(prefer-coding-system 'utf-8)

;; Use windmove bindings
;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)

;; Do not use tabs for indentation
(setq-default indent-tabs-mode nil)
(menu-bar-mode t)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(delete-selection-mode t)
(global-linum-mode t)

;; Turn off mouse interface early in startup to avoid momentary
;; display
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(set-cursor-color "black")

;; Font settings
;; (set-default-font "Consolas for Powerline FixedD")
(set-face-attribute 'default nil :height 140) ;; font-size: 18px

(setq default-frame-alist
      '((cursor-color . "red")))

;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)

(global-visual-line-mode 1)

(display-time)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'uncomment-region)
(global-set-key [f5] 'indent-region)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-l" 'end-of-line)

(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-xt" 'select-frame-by-name)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-xy" 'revert-buffer)


;; Emacs backups!
;; disable backups at all:
;; (setq make-backup-files nil)

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


;;some custom functions, stolen for internet
(defun geosoft-forward-word ()
   ;; Move one word forward. Leave the pointer at start of word
   ;; instead of emacs default end of word. Treat _ as part of word
   (interactive)
   (forward-char 1)
   (backward-word 1)
   (forward-word 2)
   (backward-word 1)
   (backward-char 1)
   (cond ((looking-at "_") (forward-char 1) (geosoft-forward-word))
         (t (forward-char 1))))
(defun geosoft-backward-word ()
 ;; Move one word backward. Leave the pointer at start of word
 ;; Treat _ as part of word
  (interactive)
  (backward-word 1)
  (backward-char 1)
  (cond ((looking-at "_") (geosoft-backward-word))
        (t (forward-char 1))))

(global-set-key [C-right] 'geosoft-forward-word)
(global-set-key [C-left] 'geosoft-backward-word)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq path-to-ctags "/usr/local/bin/ctags") ;; <- you're ctags path here

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name dir-name))
  )

(global-set-key "\C-ct" 'visit-tags-table)
(global-set-key "\C-cd" 'create-tags)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(defun colorize-compilation-buffer ()
  (interactive)
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)


;; Projectile Mode is one among many ways of handling projects in Emacs
(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

;; Fix typos in code comments, strings etc.
;; (require 'flyspell)
;; (setq flyspell-issue-message-flg nil)
;; (add-hook 'enh-ruby-mode-hook
;;           (lambda () (flyspell-prog-mode)))

;; (add-hook 'web-mode-hook
;;           (lambda () (flyspell-prog-mode)))
;; flyspell mode breaks auto-complete mode without this.
;; (ac-flyspell-workaround)

;; Activate minor-major modes
(add-hook 'coffee-mode-hook
         (lambda () (highlight-indentation-current-column-mode)))

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
                               (define-key ruby-mode-map (kbd "M-r") 'run-rails-test-or-ruby-buffer))))
(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun haml-mode-hook ()
  (autoload 'haml-mode "haml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
  (add-hook 'haml-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (define-key haml-mode-map "\C-m" 'newline-and-indent))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun run-rails-test-or-ruby-buffer ()
  (interactive)
  (if (is-rails-project)
      (let* ((path (buffer-file-name))
             (filename (file-name-nondirectory path))
             (test-path (expand-file-name "test" (textmate-project-root)))
             (command (list ruby-compilation-executable "-I" test-path path)))
        (pop-to-buffer (ruby-compilation-do filename command)))
    (ruby-compilation-this-buffer)))

;; Activate enclose mode
(enclose-global-mode t)

;; Maximize the Emacs frame and stay within the display resolution.
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; Load color theme
(load-theme 'soft-morning t)

;; Recent file history (http://stackoverflow.com/a/3527488/1052356)
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)
(setq recentf-auto-cleanup 'never)
