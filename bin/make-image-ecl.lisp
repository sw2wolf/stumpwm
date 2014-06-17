#!ecl -norc -q -shell

(push #p"~/quicklisp/dists/quicklisp/software/cl-ppcre-2.0.7/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :cl-ppcre)

(require 'clx)

(push #p"~/quicklisp/local-projects/stumpwm/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :stumpwm)

(asdf:make-build 'stumpwm :type :program :monolithic t
                 :move-here "."
                 :name-suffix ""
                 :epilogue-code '(progn
                                  (stumpwm:set-contrib-dir "/home/sw2wolf/quicklisp/local-projects/stumpwm/contrib")
                                  (stumpwm:stumpwm)))
