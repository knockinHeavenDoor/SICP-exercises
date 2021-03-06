(define (+ a b)
	(if (= a 0)
	b
	(inc (+ (dec a) b))))

;;(+ 4 5)
;;(inc (+ 3 5))
;;(inc (inc (+ 2 5)))
;;(inc (inc (inc (+ 1 5))))
;;(inc (inc (inc (inc (+ 0 5)))))
;;(inc (inc (inc (inc 5))))
;;(inc (inc (inc 6)))
;;(inc (inc 7))
;;(inc 8)
;;9
;;在代换模型展示中包含了伸展和收缩两个阶段，并且伸展阶段所需的额外存储量和计算所需的步数都正比于参数a。因此这是一个线性递归过程

(define (+ a b)
	(if (= a 0)
	b
	(+ (dec a) (inc b))))

;;(+ 4 5)
;;(+ 3 6)
;;(+ 2 7)
;;(+ 1 8)
;;(+ 0 9)
;;9
;;在这个过程中并没有任何增长或者收缩，而其计算过程可用固定数目的状态变量（a）描述。这是一个线性迭代过程
