(defpackage :level-order-traversal-tests
  (:use :cl :cacau :assert-p :level-order-traversal))

(in-package :level-order-traversal-tests)

(defparameter *tree* (make-node :value 3
				:left (make-node :value 2 :left (make-node :value 1))
				:right (make-node :value 5
						  :left (make-node :value 4)
						  :right (make-node :value 7))))

(deftest "level-order-traversal" ()
  (equalp-p '(3 2 5 1 4 7) (level-order-traversal *tree*)))

(deftest "zig-zag-order-traversal" ()
  (equalp-p '(3 5 2 1 4 7) (zig-zag-order-traversal *tree*)))
