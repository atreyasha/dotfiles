;; -*- lexical-binding: t -*-
;; -*- mode: emacs-lisp -*-
;; Basic Elpy layer for Spacemacs

(defconst elpy-packages '(elpy))

(defun elpy/init-elpy ()
  (use-package elpy
    :ensure t
    :defer t
    :init (advice-add 'python-mode :before 'elpy-enable)))
