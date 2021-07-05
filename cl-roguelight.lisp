;;;; cl-roguelight.lisp

(in-package #:cl-roguelight)

(defparameter *screen-width* 80)
(defparameter *screen-height* 50)
(defparameter *map-width* 80)
(defparameter *map-height* 46)

(defun handle-keys ()
  (let ((action nil))
    (blt:key-case (blt:read)
      (:up (setf action (list :move (cons 0 -1))))
      (:down (setf action (list :move (cons 0 1))))
      (:left (setf action (list :move (cons -1 0))))
      (:right (setf action (list :move (cons 1 0))))
      (:close (setf action (list :quit t)))
      (:escape (setf action (list :quit t))))
    action))

(defun config ()
  (blt:set "window.resizeable = true")
  (blt:set "window.size = ~Ax~A" *screen-width* *screen-height*)
  (blt:set "window.title = Roguelight"))

(defun main ()
  (blt:with-terminal
   (config)
   (loop :with player-x = (/ *map-width* 2)
     :and player-y = (/ *map-height* 2)
     :and map = (make-instance 'game-map :w *map-width* :h *map-height*)
     :do
     (fov map player-x player-y)
     (render-all map player-x player-y)
     (let* ((action (handle-keys))
            (move (getf action :move))
            (exit (getf action :quit)))
       (if exit
         (return))
       (when move
         (incf player-x (car move))
         (incf player-y (cdr move)))))))
