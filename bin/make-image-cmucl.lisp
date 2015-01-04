#!lisp -batch
(load "~/quicklisp/asdf")

(push #p"~/quicklisp/dists/quicklisp/software/cl-ppcre-2.0.9/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :cl-ppcre)

(push #p"~/quicklisp/dists/quicklisp/software/clx-20141106-git/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :clx)

(push #p"~/quicklisp/local-projects/stumpwm/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :stumpwm)

(ext:save-lisp "stumpwm" 
               :purify t :load-init-file nil :process-command-line nil 
               :executable t :batch-mode nil :print-herald nil 
               :init-function #'stumpwm:stumpwm)

(quit)
