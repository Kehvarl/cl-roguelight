;;;; cl-roguelight.asd

(asdf:defsystem #:cl-roguelight
  :description "Describe cl-roguelight here"
  :author "Kehvarl <Kehvarl@Kehvarl.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-blt)
  :components ((:file "package")
               (:file "cl-roguelight")))
