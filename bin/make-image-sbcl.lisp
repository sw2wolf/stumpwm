#!/usr/local/bin/sbcl --script
;; #-quicklisp
;; (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
;;                                        (user-homedir-pathname))))
;;   (when (probe-file quicklisp-init)
;;     (load quicklisp-init)))
(require :asdf)

(push #p"~/quicklisp/dists/quicklisp/software/cl-ppcre-2.0.9/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :cl-ppcre)
;(ql:quickload :cl-ppcre)

(push #p"~/quicklisp/dists/quicklisp/software/clx-20141106-git/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :clx)
;(ql:quickload :clx)

(push #p"~/quicklisp/local-projects/stumpwm/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :stumpwm)
;(ql:quickload :stumpwm)

(sb-ext:save-lisp-and-die "stumpwm" :toplevel
   (lambda ()
;; asdf requires sbcl_home to be set, so set it to the value when the image was built
      (sb-posix:putenv (format nil "SBCL_HOME=~A" #.(sb-ext:posix-getenv "SBCL_HOME")))
      (stumpwm:stumpwm) 0)
    :executable t)

(quit)
