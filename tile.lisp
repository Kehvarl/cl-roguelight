(in-package #:cl-roguelight)

(defclass tile ()
  ((light :initarg :light
          :accessor tile/light
          :initform 0)
   (visible :initarg :visible
            :accessor tile/visible
            :initform nil)
   (blocked :initarg :blocked 
            :accessor tile/blocked
            :initform nil)
   (block-sight :initarg :block-sight
                :accessor tile/block-sight
                :initform nil)))

(defmethod initialize-instance :after ((tile tile) &rest initargs)
  (declare (ignore initargs))
  (with-slots (blocked block-sight) tile
    (if (null block-sight)
      (setf block-sight blocked))))

(defmethod set-tile-slots ((tile tile) &key (blocked nil blocked-supplied-p)
                                       (block-sight nil block-sight-supplied-p)
                                       (light nil light-supplied-p))
  (if blocked-supplied-p
    (setf (slot-value tile 'blocked) blocked))
  (if block-sight-supplied-p
    (setf (slot-value tile 'block-sight) block-sight))
  (if light-supplied-p
    (setf (slot-value tile 'light) light)))
