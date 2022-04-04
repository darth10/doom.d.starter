;;; ~/.doom.d/packages.el -*- no-byte-compile: t; -*-

(package! cider-eval-sexp-fu)
(package! eval-sexp-fu)
(package! helm-ls-git)
(package! flycheck-joker :disable t)

(when IS-WINDOWS
  (package! forge :disable t))
