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
    org
    web-mode))

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
(setq tab-width 4)
(custom-set-variables
 '(tab-stop-alist (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80
                            84 88 92 96 100 104 108 112 116 120))))

(require 'elpy)
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq flycheck-highlighting-mode 'lines)
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;(require 'py-autopep8)
;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'smartparens)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

;; setup slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
