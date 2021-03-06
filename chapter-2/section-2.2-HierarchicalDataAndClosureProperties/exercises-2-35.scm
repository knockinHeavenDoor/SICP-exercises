(define (count-leaves x)
	(cond ((null? x) 0)
		((not (pair? x)) 1)
		(else (+ (count-leaves (car x))
			(count-leaves (cdr x))))))

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence) (accumulate op initial (cdr sequence)))))

(define (count-leave t)
	(accumulate + 0 (map (lambda(x)
                           (if (pair? x)
                               (count_leaves x)
                               1)) t)))