(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.emacs-china.org/gnu/") t)
(package-initialize)


(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
;;(require 'setup-helm)
;;(require 'setup-helm-gtags)
(require 'setup-ivy-counsel)
(require 'setup-editing)
(require 'setup-company)
;;(require 'setup-c)
(require 'cquery)
(setq cquery-executable "/usr/local/bin/cquery")
(setq cquery-sem-highlight-method 'font-lock)
;; alternatively, (setq cquery-sem-highlight-method 'overlay)

;; For rainbow semantic highlighting
(cquery-use-default-rainbow-sem-highlight)

(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

(use-package cquery
  :commands lsp-cquery-enable
  :init (add-hook 'c-mode-hook #'cquery//enable)
  (add-hook 'c++-mode-hook #'cquery//enable))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-archives
   (quote
    (("melpa" . "http://elpa.emacs-china.org/melpa/")
     ("gnu" . "http://elpa.emacs-china.org/gnu/"))))
 '(package-selected-packages
   (quote
    (highlight-symbol ivy-xref company-lsp cquery projectile helm counsel-projectile counsel ivy back-button ace-jump-mode projectile-speedbar helm-ag ag helm-core helm-gtags helm-projectile xah-find lsp-clangd company-irony irony flycheck-rtags company company-rtags rtags use-package)))
 '(projectile-enable-caching t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".vscode")))
 '(projectile-mode t nil (projectile))
 '(projectile-switch-project-action (quote helm-projectile-find-file)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
