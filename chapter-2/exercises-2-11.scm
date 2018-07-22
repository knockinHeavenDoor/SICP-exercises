(load "exercises-2-7.scm")

(define (mul-interval x y)
  (if (> (lower-bound x) 0)
      (if (> (lower-bound y) 0)
	  (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y)))
	  (if (> (upper-bound y) 0)
	      (make-interval (* (upper-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y)))
	      (make-interval (* (lower-bound x) (upper-bound y)) (* (lower-bound x) (upper-bound y)))))
      (if (> (upper-bound x) 0)
	  (if (> (lower-bound y) 0)
	      (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (upper-bound y)))
	      (if (> (upper-bound y) 0)
		  (make-interval (* (lower-bound x) (lower-bound y)) 
				 (* (upper-bound x) (upper-bound y)))
		  (make-interval (* (lower-bound x) (lower-bound y))
				 (* (upper-bound x) (upper-bound y)))))
	  (if (> (lower-bound y) 0)
	      (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y)))
	      (if (> (upper-bound y) 0)
		  (make-interval (* (lower-bound x) (lower-bound y)) 
				 (* (upper-bound x) (upper-bound y)))
		  (make-interval (* (lower-bound x) (lower-bound y)) 
				 (* (upper-bound x) (upper-bound y))))) )))