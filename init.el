;; Package Manager
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


;; Install following packages if aren't installed
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-eshell starter-kit-js starter-kit-ruby ruby-compilation ruby-hash-syntax rubyinterpol ruby-mode ruby-test-mode ruby-end ruby-tools ruby-block company-inf-ruby inf-ruby ruby-mode ruby-test-mode ruby-end ruby-tools ruby-block)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
