;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(doom-debug-mode -1)


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)

(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t
      global-visual-line-mode nil)

(remove-hook! 'text-mode-hook #'visual-line-mode)

(after! dired
  (remove-hook! 'dired-mode-hook #'dired-omit-mode))

(after! flycheck
  (setq flycheck-emacs-lisp-load-path 'inherit)

  (defadvice! +flycheck--flycheck-popup-tip-maybe-a (&rest _)
    :before-while #'flycheck-popup-tip-show-popup
    (not (region-active-p))))

(after! yasnippet
  (setq yas-indent-line 'fixed))

(after! which-key
  (which-key-enable-god-mode-support)
  (setq which-key-separator " : "))

(after! lispy
  (lispy-set-key-theme (setq lispy-key-theme '(paredit c-digits))))

(after! calculator
  (advice-add 'calculator :after (λ! (enlarge-window 2))))

(after! helm
  (setq helm-allow-mouse t))

(use-package! helm-ls-git
  :after helm
  :commands (helm-ls-git-ls))

(after! lsp-mode
  (setq lsp-ui-doc-enable nil
        lsp-ui-sideline-enable nil
        lsp-modeline-diagnostics-enable nil))


;;; Emacs Lisp

(use-package! eval-sexp-fu
  :hook ((lisp-mode emacs-lisp-mode eshell-mode) . +eval-sexp-fu--init)
  :custom-face
  (eval-sexp-fu-flash ((t (:foreground "DodgerBlue" :background "DimGray"))))
  :config
  (defun +eval-sexp-fu--init ()
    (require 'eval-sexp-fu)))

;;; Clojure

(after! clojure-mode
  (define-clojure-indent
    (GET 2)
    (POST 2)
    (PUT 2)
    (PATCH 2)
    (DELETE 2)
    (match 1)
    (friend/authorize 1))

  (defadvice! +clojure-thread-first-all-a (&rest _)
    :after #'clojure-thread-first-all
    (+clojure-thread-oneline))

  (defadvice! +clojure-thread-last-all-a (&rest _)
    :after #'clojure-thread-last-all
    (+clojure-thread-oneline)))

(use-package! cider-eval-sexp-fu
  :after (clojure-mode cider))

;;; JavaScript

(after! js2-mode
  (setq js2-basic-offset 2))
