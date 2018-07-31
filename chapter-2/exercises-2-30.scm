(define (square-tree var)
	(define (iter temp len)
		(let ([current (list-ref var len)]
				[lastIndex (- (length var) 1)])
			(if (list? current)
				(if (= len lastIndex)
					(append temp (square-tree current))
          			(iter (append temp (square-tree current)) (+ len 1)))
			  	(if (= len lastIndex)
			    	(append temp (list (square current)))
          			(iter (append temp (list (square current))) (+ len 1))))))
	(iter '() 0))

(define (square x)
	(* x x)
