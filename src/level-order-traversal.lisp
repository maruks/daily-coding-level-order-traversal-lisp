(defpackage :level-order-traversal
  (:use :cl :alexandria :queues :iterate)
  (:export :level-order-traversal :zig-zag-order-traversal :make-node))

(in-package :level-order-traversal)

(defstruct node value left right)

(defun ->level-order (queue &optional result)
  (flet ((push-node (node accessor-fn)
	   (when-let (node-to-push (funcall accessor-fn node))
		(qpush queue node-to-push))))
    (if-let (node (qpop queue))
      (progn
	(push-node node #'node-left)
	(push-node node #'node-right)
	(->level-order queue (cons (node-value node) result)))
      (nreverse result))))

(defun ->zig-zag-order (queue max-level &optional tmp-result result)
  (flet ((append-result ()
	   (append (if (oddp max-level)
		       (reverse tmp-result)
		       tmp-result)
		   result))
	 (push-node (node level accessor-fn)
	   (when-let (node-to-push (funcall accessor-fn node))
	     (qpush queue (cons node-to-push (1+ level))))))
    (if-let (elem (qtop queue))
      (destructuring-bind (node . level) elem
	(if (< max-level level)
	    (->zig-zag-order queue level nil (append-result))
	    (progn
	      (qpop queue)
	      (push-node node level #'node-left)
	      (push-node node level #'node-right)
	      (->zig-zag-order queue level (cons (node-value node) tmp-result) result))))
      (nreverse (append-result)))))

(defun level-order-traversal (root)
  (let ((queue (make-queue :simple-queue)))
    (qpush queue root)
    (->level-order queue)))

(defun zig-zag-order-traversal (root)
  (let ((queue (make-queue :simple-queue)))
    (qpush queue (cons root 0))
    (->zig-zag-order queue 0)))
