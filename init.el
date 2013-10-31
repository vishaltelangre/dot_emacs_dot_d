;; Let Pallet handle package management stuff!
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/extra")
;; (add-to-list 'load-path "~/.emacs.d/vendor/blah_package")

(load '"variables.el")
(load '"keybindings.el")
(load '"ruby-and-stuff.el")
(load '"org-mode.el")
(load '"auto-complete-mode.el")
(load '"web-mode.el")
(load '"ibus-mode.el")
(load '"twittering-mode.el")
(load '"common.el")

(load '"extra.el")
