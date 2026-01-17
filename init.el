(defun config-file (name) (concat "~/.emacs.d/elisp/" name ".el"))
(defun load-config (name) (load-file (config-file name)))

(load-config "emacs")
(load-config "which-key")
