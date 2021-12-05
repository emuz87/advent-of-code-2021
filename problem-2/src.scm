(import (chicken io))
(import (chicken string))

(define lines (read-lines (open-input-file "data.txt")))

(define (parse lst)
  (define (go lst2 acc)
    (if (< (length lst2) 1 ) acc
      (let ([ltr (car (string->list (car lst2)))]
	    [num (string->number (cadr (string-split (car lst2))))])
	(go (cdr lst2)
	    (if (eqv? ltr #\f) (list (+ (car acc) num) (cadr acc))
	      (list (car acc)
		    (+ (cadr acc) (if (eqv? ltr #\u) (- num) num))))))))
  (let ([res (go lst '(0 0))]) (* (car res) (cadr res))))

(print (parse lines))
