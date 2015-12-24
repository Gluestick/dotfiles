;; Enable package management with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; For important compatibility libraries like cl-lib
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;; Update the list oof packages
(when (not package-archive-contents)
  (package-refresh-contents))

;; Define packages and ensure all are installed
(defvar my-packages '(evil company solarized-theme xah-elisp-mode))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Enable ViM emulation
(require 'evil)
(evil-mode 1)

;; Solarize emacs
(require 'solarized)
(load-theme 'solarized-dark t)

;; Sane backspace behaviour
(define-key key-translation-map [?\C-h] [?\C-?])

;; Line numbers in all buffers
(global-linum-mode 1)

;; Disable GUI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
