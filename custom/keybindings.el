;; Use windmove bindings
;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)

;;*********************

(fset 'yes-or-no-p 'y-or-n-p)

;;*********************

(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'uncomment-region)

;;*********************

(global-set-key [f5] 'indent-region)

;;*********************

(global-set-key "\C-w" 'kill-region)
(global-set-key "\C-h" 'delete-backward-char)
;; now fix ctrl+h for help
(global-set-key "\C-?" 'help-command)
(global-set-key "\C-x\C-k" 'backward-kill-word)

(global-set-key "\C-l" 'end-of-line)
(global-set-key "\C-xt" 'select-frame-by-name)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-xy" 'revert-buffer)

;;*********************

;; CTags bindings
(global-set-key "\C-ct" 'visit-tags-table)
(global-set-key "\C-cd" 'create-tags)

;;*********************

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;;*********************

;; Find files in a control versioned directory
 (global-set-key (kbd "C-x pf") 'find-file-in-repository)
