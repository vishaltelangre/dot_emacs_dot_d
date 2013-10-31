;; SmartParens mode is many things. It automatically inserts closing parethesis, tags, end’s depending on major-mode. Highlights them, allows you to move between them. Allows you to wrap existing texts.
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))