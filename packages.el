;;; ~/.doom.d/packages.el -*- no-byte-compile: t; -*-

(package! cider-eval-sexp-fu)
(package! flycheck-joker :disable t)

(when IS-WINDOWS
  (package! forge :disable t))
