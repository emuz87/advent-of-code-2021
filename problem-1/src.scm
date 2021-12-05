(import (chicken io))
(define lines (map string->number (read-lines (open-input-file "data.txt"))))

(define (func lst)
  (define (go lst2 acc)
    (if (< (length lst2) 2) acc
      (go (cdr lst2) (if (> (cadr lst2) (car lst2)) (+ acc 1) acc))))
  (go lst 0))

(print (func lines))
