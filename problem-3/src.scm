(import (chicken io))

(define raw-lines (map string->list (read-lines (open-input-file "data.txt"))))
(define lines (map (lambda (a) (map (lambda (b) (string->number (string b))) a)) raw-lines))
(define dacc '(0 0 0 0 0 0 0 0 0 0 0 0))

(define (calc lst)
  (define (go lst2 acc)
    (if (null? lst2) acc (go (cdr lst2) (map + acc (car lst2)))))
  (define (go2 c lst2 acc)
    (if (null? lst2) ((lambda (x) (define (go3 lst3 acc2 count)
				    (if (null? lst3) acc2 (go3 (cdr lst3) (+ acc2 (* (car lst3) (expt 2 count))) (+ count 1)))) 
			(go3 x 0 0))
			acc) (go2 c (cdr lst2)
			      (cons
				(if (c (car lst2) (/ (length lst) 2)) 1 0) acc))))
  (* (go2 > (go lst dacc) '()) (go2 < (go lst dacc) '())))

(print (calc lines))
