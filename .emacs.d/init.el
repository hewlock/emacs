(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(use-package diminish
  :ensure t)

(require 'use-package)
(require 'diminish)
;; (require 'bind-key)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'bind-key)
;;   (package-install 'diminish)
;;   (package-install 'use-package))

(defun config-file (name) (concat "~/.emacs.d/elisp/" name ".el"))
(defun load-config (name) (load-file (config-file name)))

;; dependencies
(load-config "emacs")
(load-config "emacs-project")
(load-config "evil")
;; (load-config "org")

;; sorted
(load-config "bookmark")
;; (load-config "coffee-mode")
;; (load-config "company")
;; (load-config "dired")
;; (load-config "evil-surround")
;; (load-config "eww")
(load-config "ivy")
;; (load-config "magit")
(load-config "markdown-mode")
(load-config "neotree")
;; (load-config "org-journal")
;; (load-config "org-publish")
;; (load-config "rainbow-delimiters")
;; (load-config "undo-fu")
;; (load-config "web-mode")
(load-config "which-key")
(load-config "whitespace")
;; (load-config "yasnippet")

;; (setq custom-file (config-file "custom"))
;; (load custom-file)

;; (if (display-graphic-p) (mrm/light-theme) (mrm/dark-theme))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel diminish evil ivy-hydra markdown-mode neotree rainbow-delimiters)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
