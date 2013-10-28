;; Let Pallet handle package management stuff!
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/extra")

;; Don't place this file in version control
(load '"extra.el")

(load '"00common.el")
(load '"01ruby.el")
;; (load '"02org.el")
(load '"03auto-complete.el")
(load '"04web-mode.el")