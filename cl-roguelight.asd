;;;; cl-roguelight.asd

(asdf:defsystem #:cl-roguelight
                :description "Playing with lighting in Common Lisp Roguelike"
                :author "Kehvarl <Kehvarl@Kehvarl.com>"
                :license  "MIT"
                :version "0.0.1"
                :serial t
                :depends-on (#:cl-blt)
                :components ((:file "package")
                             (:file "tile")
                             (:file "rect")
                             (:file "game-map")
                             (:file "math")
                             (:file "fov")
                             (:file "render-functions")
                             (:file "cl-roguelight")))
