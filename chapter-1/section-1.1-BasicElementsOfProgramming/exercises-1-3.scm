(define (sumTwo a b c) 
	(cond ((>= a b c) (+ a b))
	       (( >= b a c) (+ b a))
		((>= b c a) (+ b c))
		((>= a c b) (+ a c))
		((>= c a b) (+ c a))
		(else (+ c b))
))
(display (sumTwo 99 108 67))
