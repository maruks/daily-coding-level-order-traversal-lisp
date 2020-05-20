;;;; level-order-traversal.asd

(defsystem "level-order-traversal"
  :description "Describe level-order-traversal here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (:alexandria :queues.simple-queue :iterate)
  :components ((:module "src"
		:components ((:file "level-order-traversal"))))
  :in-order-to ((test-op (test-op "level-order-traversal/tests"))))

(defsystem "level-order-traversal/tests"
  :license "Specify license here"
  :depends-on (:level-order-traversal
	       :cacau
	       :assert-p)
  :serial t
  :components ((:module "tests"
		:components ((:file "level-order-traversal-tests"))))
  :perform (test-op (o c) (symbol-call 'cacau 'run :colorful t :reporter :list)))
