(define (smallest-devisor n)
	(find-divisor n 2))

(define (find-divisor n test)
	(cond ((> (square test) n) n)
		((divides? test n) test)
		(else (find-divisor n (+ test 1)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (square x)
	(* x x))
;;1001 2700
;;10001 8900
;;100001 26000