# level-order-traversal


https://www.hackerrank.com/challenges/30-binary-trees/problem

![Alt text](./bst.png?raw=true "Binary search tree")

> We traverse each level of the tree from the root downward, and we process the nodes at each level from left to right.
> The resulting level-order traversal is 3 → 2 → 5 → 1 → 4 → 7

```
(defparameter *tree* (make-node :value 3
				:left (make-node :value 2 :left (make-node :value 1))
				:right (make-node :value 5
						  :left (make-node :value 4)
						  :right (make-node :value 7))))

(level-order-traversal *tree*)
(3 2 5 1 4 7)
(zig-zag-order-traversal *tree*)
(3 5 2 1 4 7)
```
### Test

    sbcl --non-interactive --eval "(ql:quickload :level-order-traversal/tests)" --eval "(asdf:test-system :level-order-traversal)"
