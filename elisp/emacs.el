;==============================
; Keybinds
;==============================

(global-set-key (kbd "C-S-c") 'kill-ring-save)
(global-set-key (kbd "C-S-v") 'yank)
(global-set-key (kbd "C-S-x") 'kill-region)
(global-set-key (kbd "C-S-z") 'undo)
(global-set-key (kbd "C-c b q") 'kill-this-buffer)
(global-set-key (kbd "C-c b x") 'eval-buffer)
(global-set-key (kbd "C-c d c") 'cd)
(global-set-key (kbd "C-c d p") 'pwd)
(global-set-key (kbd "C-c e r") 'mrm/reload-emacs)
(global-set-key (kbd "C-c h U") 'find-function-at-point)
(global-set-key (kbd "C-c h V") 'find-variable-at-point)
(global-set-key (kbd "C-c h b") 'describe-bindings)
(global-set-key (kbd "C-c h c") 'describe-char)
(global-set-key (kbd "C-c h f") 'describe-face)
(global-set-key (kbd "C-c h k") 'describe-key)
(global-set-key (kbd "C-c h m") 'describe-mode)
(global-set-key (kbd "C-c h s") 'describe-symbol)
(global-set-key (kbd "C-c h u") 'describe-function)
(global-set-key (kbd "C-c h v") 'describe-variable)
(global-set-key (kbd "C-c i c") 'toggle-truncate-lines)
(global-set-key (kbd "C-c i h") 'hl-line-mode)
(global-set-key (kbd "C-c i l") 'display-line-numbers-mode)
(global-set-key (kbd "C-c i o") 'read-only-mode)
(global-set-key (kbd "C-c i p") 'show-paren-mode)
(global-set-key (kbd "C-c i v") 'visual-line-mode)
(global-set-key (kbd "C-c r c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c r s") 'sort-lines)
(global-set-key (kbd "C-c r x") 'eval-region)
(global-set-key (kbd "C-c w b") 'balance-windows)

;(global-set-key (kbd "C-c b p") 'mrm/print-file-name)
;(global-set-key (kbd "C-c b r") 'mrm/rename-file-and-buffer)
;(global-set-key (kbd "C-c i i") 'mrm/toggle-indent-tabs-mode)
;(global-set-key (kbd "C-c i t") 'mrm/toggle-theme)
;(global-set-key (kbd "C-c p c") 'mrm/project-cd)
;(global-set-key (kbd "C-c p o") 'mrm/project-find-file)
;(global-set-key (kbd "C-c p p") 'mrm/project-pwd)
;(global-set-key (kbd "C-c p q") 'mrm/project-quit)
;(global-set-key (kbd "C-c r f") 'mrm/format-region)
;(global-set-key (kbd "C-c w R") 'mrm/rotate-windows-anticlockwise)
;(global-set-key (kbd "C-c w r") 'mrm/rotate-windows-clockwise)
;(global-set-key (kbd "C-c w s") 'mrm/toggle-window-split)

;==============================
; Auto Backups
;==============================

(defvar backup-file-directory "~/.backup/emacs/")
(make-directory backup-file-directory t)

(setq-default backup-by-copying t)
(setq-default backup-directory-alist `((".*" . ,backup-file-directory)))
(setq-default delete-old-versions t)
(setq-default kept-new-versions 9)
(setq-default kept-old-versions 2)
(setq-default version-control t)

;==============================
; Auto Saves
;==============================

(auto-save-visited-mode t)

(add-hook 'auto-save-hook 'mrm/save-all-buffers)
(add-hook 'focus-out-hook 'mrm/save-all-buffers)

(advice-add 'org-agenda-quit :after #'mrm/save-all-buffers)
(advice-add 'other-window :after #'mrm/save-all-buffers)
(advice-add 'switch-to-buffer :after #'mrm/save-all-buffers)
(advice-add 'windmove-down :after #'mrm/save-all-buffers)
(advice-add 'windmove-left :after #'mrm/save-all-buffers)
(advice-add 'windmove-right :after #'mrm/save-all-buffers)
(advice-add 'windmove-up :after #'mrm/save-all-buffers)

(defun mrm/save-all-buffers (&rest args)
  "Save all buffers."
  (interactive "p")
  (save-some-buffers t))

;==============================
; Helper Functions
;==============================

(defun mrm/reload-emacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
