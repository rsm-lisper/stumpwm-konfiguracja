;; -*- mode: lisp -*-

(in-package :stumpwm)

(ql:quickload 'swank)
(swank:create-server :port 5000 :dont-close t)

(set-module-dir #P"~/.stumpwm.d/contrib/")

(load-module "net")
(load-module "cpu")
(load-module "mem")

(set-prefix-key (kbd "C-z"))

(define-key *root-map* (kbd "C-c") "exec konsole")
(define-key *root-map* (kbd "c") "exec konsole")

;; turn on/off the mode line for the current head only.
(toggle-mode-line (current-screen)
		  (current-head))

;; set up mode-line
(setf *screen-mode-line-format*
      (list "%d [%n]"
	    " %l |" ; net info
	    " %c %C %t |" ; cpu info
	    " %M %N" ; mem info
	    (string #\NewLine)
	    "%w")) ; window list

(setf *mode-line-timeout* 5)
(setf *normal-border-width* 6)
(set-focus-color 'orange)
