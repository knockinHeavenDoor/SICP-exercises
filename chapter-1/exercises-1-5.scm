(define (p) (p))
(define (test x y)
	(if (= x 0) 0 y))
(test 0 (p))

;正则序：(test 0 (p))就等于(if (= 0 0) 0 (p)))，根据习题中确定的谓词先求值在确定与之对应的子表达式，所以会直接返回0
;应用序：应用序是先对参数求值，又因为(p)会无限调用其自身，所以程序会陷入无限的递归中
