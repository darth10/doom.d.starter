;;; ~/.doom.d/init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       helm

       :ui
       doom
       doom-quit
       fill-column
       hl-todo
       indent-guides
       modeline
       nav-flash
       neotree
       ophints
       (popup +all +defaults)
       unicode
       vc-gutter
       window-select
       workspaces

       :checkers
       grammar
       syntax
       (spell +flyspell)

       :editor
       file-templates
       fold
       format
       lispy
       multiple-cursors
       rotate-text
       snippets

       :emacs
       (dired +icons)
       electric
       undo
       vc

       :term
       eshell
       shell

       :tools
       debugger
       editorconfig
       gist
       (lookup +docsets)
       lsp
       (magit +forge)

       :lang
       (clojure +lsp)
       emacs-lisp
       (javascript +lsp)
       (markdown +grip)
       org
       sh
       web
       yaml

       :app
       calendar

       :config
       (default +bindings +smartparens))
