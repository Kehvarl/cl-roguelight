(in-package #:cl-roguelight)

(defparameter *color-map* (list :dark-wall (blt:rgba 0 0 100)
                                :dark-ground (blt:rgba 50 50 150)
                                :light-wall (blt:rgba 130 110 50)
                                :light-ground (blt:rgba 200 180 50)))

(defun draw (player-x player-y)
  (blt:clear)
  (setf (blt:color) (blt:white)
        (blt:cell-char player-x player-y) #\@)
  (blt:refresh))

(defun render-all (map player-x player-y)
  (blt:clear)
  (dotimes (y (game-map/h map))
    (dotimes (x (game-map/w map))
      (let* ((tile (aref (game-map/tiles map) x y))
             (wall (tile/blocked tile))
             (visible (tile/visible tile))
             (explored t))
       (cond (visible
               (if wall
                (setf (blt:background-color) (getf *color-map* :light-wall))
                (setf (blt:background-color) (getf *color-map* :light-ground)))
               (setf (blt:cell-char x y) #\Space))
             (explored
               (if wall
                (setf (blt:background-color) (getf *color-map* :dark-wall))
                (setf (blt:background-color) (getf *color-map* :dark-ground)))
               (setf (blt:cell-char x y) #\Space))))))
  ;;(mapc #'(lambda (entity) (draw entity map)) entities)
  (draw player-x player-y)
  (setf (blt:background-color) (blt:black))
  (blt:refresh))
