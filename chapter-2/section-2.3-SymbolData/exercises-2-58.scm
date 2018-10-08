;;(variable? e)      			e�Ǳ�����
;;(same-variable?    			v1 v2) v1��v2��ͬһ��������
;;(sum? e)  		   			e�Ǻ�ʽ��
;;(addend e)         			e�ı�����
;;(augend e)		   			e�ļ���
;;(make-sum a1 a2)   			����a1��a2�ĺ�ʽ
;;(product? e)       			e�ǳ�ʽ��
;;(multiplier e)     			e�ı�����
;;(multiplicand e)   			e�ĳ���
;;(make-product m1 m2) 		����m1��m2�ĳ�ʽ   

(define (deriv exp var)
	(cond ((number? exp) 0)
		((variable? exp)
			(if (same-variable? exp var) 1 0))
		((sum? exp)
			(make-sum (deriv (addend exp) var)
				(deriv (augend exp) var)))
		((product? exp)
			(make-sum (make-product (multiplier exp)
					(deriv (multiplicand exp) var))
				(make-product (deriv (multiplier exp) var)
					(multiplicand exp))))
		(else (error "unknow expression type -- DERIV" exp))))
		
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))
	
(define (make-sum a1 a2) (list '+ a1 a2))

(define (make-product m1 m2) (list '* m1 m2))

(define (sum? x)
	(and (pair? x) (eq? (car x) '+)))
	
(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
	(and (pair? x) (eq? (car x) '*)))
	
(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

;;solution a

(define (make-sum a1 a2)
    (cond ((=number? a1 0)
            a2)
        ((=number? a2 0)
            a1)
        ((and (number? a1) (number? a2))
            (+ a1 a2))
        (else 
			(list a1 '+ a2))))              ; �޸�

(define (sum? x)
    (and (pair? x)
        (eq? (cadr x) '+)))                ; �޸�

(define (addend s)
    (car s))                                ; �޸�

(define (augend s)
    (caddr s))
	
(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0))
            0)
        ((=number? m1 1)
            m2)
        ((=number? m2 1)
            m1)
        ((and (number? m1) (number? m2))
            (* m1 m2))
        (else
            (list m1 '* m2))))              ; �޸�

(define (product? x)
    (and (pair? x)
         (eq? (cadr x) '*)))                ; �޸�

(define (multiplier p)
    (car p))                                ; �޸�

(define (multiplicand p)
    (caddr p))
	
;;b
;;�������ʹ�ñ�׼����д���Ļ�����ô���Ǿ�û�취ֻ��ͨ���޸�ν�ʡ�ѡ�����͹��캯�����ﵽ��ȷ�����󵼵�Ŀ��
;;����Ϊ�����Ҫ�޸� deriv �������ṩ���ŵ����ȼ��������ܡ�
;;����˵���������� x + y * z �������ֿ��ܵ���˳����������֮Ϊ�������ķ�����һ���� (x + y) * z ����һ����
;;x + (y * z) �������󵼼�����˵����һ��˳�������ȷ�ģ���������˳�����ͨ���޸� deriv ���ṩ��ֻ���޸�ν�ʡ�
;;ѡ�����͹��캯����û�취�ﵽ������˳���Ŀ�ĵ�