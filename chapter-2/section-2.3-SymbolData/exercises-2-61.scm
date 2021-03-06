(define (element-of-set? x set)
	(cond ((null? set) #f)
		((= x (car set)) #t)
		((< x (car set)) #f)
		(else (element-of-set? x (cdr set)))))
		
(define (intersection-set setA setB)
	(if (or (null? setA) (null? setB))
		'()
		(let ([x1 (car setA)] [x2 (car setB)])
			(cond ((= x1 x2)
					(cons x1 (intersection-set (cdr setA) (cdr setB))))
				((< x1 x2) (intersection-set (cdr setA) setB))
				((< x2 x1) (intersection-set setA (cdr setB)))))))
				
(define (adjoin-set x set)
    (if (null? set)
        (list x)
        (let ((current-element (car set))
              (remain-element (cdr set)))
            (cond ((= x current-element)
                    set)
                  ((> x current-element)
                    (cons current-element
                          (adjoin-set x remain-element)))
                  ((< x current-element)
                    (cons x set))))))