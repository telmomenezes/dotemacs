;; Main configuration file

;; Disable toolbar
(tool-bar-mode -1)

;; Disable scroll-bars
(scroll-bar-mode -1)

;; env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
(setq initial-frame-alist '((top . 0) (left . 38) (width . 174) (height . 53)))

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Font
; check if we're on OSX
(when (featurep 'ns-win)
  (custom-set-faces
   '(default ((t (:height 120 :width normal :family "Consolas"))))))

;; Theme
;; (load-theme 'leuven t)
;; (require 'moe-theme)
;; (moe-dark)
(load-theme 'zenburn t)

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; disable underline/bold
;;(mapc
;;  (lambda (face)
;;    (set-face-attribute face nil :weight 'normal :underline nil))
;;  (face-list))

;; File navigation
;;(load "~/.emacs.d/helm")
(require 'ido)
(ido-mode t)
(setq ido-use-filename-at-point nil)

;; Rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Flyspell often slows down editing so it's turned off
(remove-hook 'text-mode-hook 'turn-on-flyspell)

;; Org-mode
(load "~/.emacs.d/orgmode")

;; Python
(elpy-enable)

;; Clojure
(load "~/.emacs.d/clojure")

;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.saves")))

;; Spell checking
(setq ispell-program-name "/usr/local/bin/aspell")
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; auctex
(getenv "PATH")
(setenv "PATH"
        (concat
         "/usr/texbin" ":"
         (getenv "PATH")))
(setq TeX-PDF-mode t)
