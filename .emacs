
(if (equal system-configuration "x86_64-unknown-linux-gnu")
    (setq system-configuration "x86_64-pc-linux-gnu"))

(setq system-name "localhost")

;; (let ((string-or-null (lambda (a) (or (stringp a) (null a)))))
;;   (eval
;;    `
   (mapc (lambda (pair)
	    (put (car pair) 'safe-local-variable (cdr pair)))
	  '((snd-file                      . stringp)
	    (iimage-mode-image-regex-alist . t)
	    (ispell-check-comments         . t)
	    (ispell-local-dictionary       . string-or-null-p)
	    (time-stamp-format             . string-or-null-p)
	    (time-stamp-start              . string-or-null-p)
	    (time-stamp-end                . string-or-null-p)))
;;    )
;;   )

(load (setq custom-file "emacs.custom.el"))

(load "emacs");;loaded twice because of custom-file by startup.el

(setq grep-find-ignored-directories
      (append grep-find-ignored-directories
	      '(
		;; Elixir
		"_build"
		;; Clojure
	        "target"
		;; Ruby
		;; "i18n"
		"log" "logs" "public/assets"
		;; Firefox addons
		"firefox-sdk"
		;; JavaScript
		"dist" "bower_components" "node_modules" ".sass-cache" ".tmp")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(require 'wget)

(require 'erlang-start)
