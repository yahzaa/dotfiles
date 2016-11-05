;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; ---------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(
    better-defaults
    cider  ;; Clojure tools
    elpy  ;; Python IDE
    flycheck  ;; realtime syntax checking
    magit
    material-theme
    py-autopep8
    smartparens
    org))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; -------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(add-hook 'before-save-hook 'whitespace-cleanup) ;; remove trailing whitespaces
(fset 'yes-or-no-p 'y-or-n-p) ;; Changes all yes/no questions to y/n type
(setq-default frame-title-format "%b (%f)") ;; full path in title bar
(set-default-font "Monaco 12")

(require 'elpy)
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'smartparens)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
;; init.el ends here

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/home/ck/code/go")
(add-to-list 'exec-path "/home/ck/code/go")
(add-hook 'before-save-hook 'gofmt-before-save)

;; setup slime
;;(load (expand-file-name "~/quicklisp/slime-helper.el"))
;;(setq inferior-lisp-program "sbcl")
