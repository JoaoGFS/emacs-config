;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(go-fontify-function-calls nil)
 '(go-fontify-variables nil)
 '(package-selected-packages
   (quote
	(go-snippets yasnippet go-mode neotree projectile smartparens company exec-path-from-shell flycheck lsp-ui lsp-mode spacemacs-theme dashboard use-package helm ergoemacs-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'dashboard)
(dashboard-setup-startup-hook)
;; Or if you use use-package
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(load-theme 'spacemacs-dark t)
(require 'neotree)

(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)

(require 'smartparens-config)

(require 'yasnippet)
(yas-global-mode 1)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook #'smartparens-global-mode)

(set-frame-font "Monospace 13")

;; set default tab char's display width to 4 spaces
(setq-default tab-width 4) ; emacs 23.1 to 26 default to 8

;; set current buffer's tab char's display width to 4 spaces
(setq tab-width 4)

(setq projectile-project-search-path '("~/Documentos/devs/"))


(ergoemacs-mode 1)
(projectile-mode +1)

(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1)
(global-linum-mode 1)

(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "M-p") 'helm-list-elisp-packages-no-fetch)
(global-set-key (kbd "M-L") 'right-word)
(global-set-key (kbd "M-J") 'left-word)
