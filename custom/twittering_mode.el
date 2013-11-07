;; Twittering Mode Configurations (twit)
(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
(setq twittering-convert-fix-size 32) ;; default is 48
(setq twittering-use-icon-storage t) ;; locally cache icons
(twittering-enable-unread-status-notifier)
(setq twittering-retweet-format '(nil _ "RT @%s: %t"))
