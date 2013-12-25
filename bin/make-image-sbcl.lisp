#!/usr/local/bin/sbcl --script

(setf *load-verbose* nil *load-print* nil)
(load "~/quicklisp/asdf")

(push #p"~/quicklisp/dists/quicklisp/software/cl-ppcre-2.0.4/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :cl-ppcre)

(push #p"~/quicklisp/dists/quicklisp/software/clx-20121125-git/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :clx)

(push #p"~/quicklisp/local-projects/stumpwm/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :stumpwm)

(sb-ext:save-lisp-and-die "stumpwm" :toplevel
   (lambda ()
;; asdf requires sbcl_home to be set, so set it to the value when the image was built
      (sb-posix:putenv (format nil "SBCL_HOME=~A" #.(sb-ext:posix-getenv "SBCL_HOME")))
      (stumpwm:stumpwm) 0)
    :executable t)

(quit)
