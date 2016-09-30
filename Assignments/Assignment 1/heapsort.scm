; CSI 3120 Assignment 1 Question 1
; Student Name: Matthew Langlois
; Student Number: 7731813
; Student Email: mlang025@uottawa.ca

(define (heapsort lst)
  (if (null? lst)
    '()
    (begin
      (heapify lst (countItems lst))
      (heapsortRec lst (- (countItems lst) 1)))))

(define (heapsortRec lst end)
  (if (zero? end)
      lst
      (begin
        (set! lst (swap lst 0 end))
        (set! lst (siftDown lst 0 (- end 1)))
        (heapsortRec lst (- end 1)))))

(define (heapify lst count) 
  (heapifyRec lst (floor (/ (- (countItems lst) 1) 2))))

(define (heapifyRec lst start)
  (if (>= start 0) 
    (begin 
      (set! lst (siftDown lst start (- (countItems lst) 1)))
      (heapifyRec lst (- start 1)))
      lst))


(define (siftDown lst start end)
  (define child (+ (* start 2)  1))
    (cond
      ((<= child end) 
        (begin
          (and 
            (and 
              (<= (+ child 1) end) 
              (< (getIndex lst child) (getIndex lst (+ child 1))))
            (set! child (+ child 1)))
          (if (< (getIndex lst start) (getIndex lst child))
             (begin
                (set! lst (swap lst start child))
                (siftDown lst child end))
                lst)))
      (else lst)))

(define (getIndex lst current) 
  (if (= current 0) (car lst)
      (getIndex (cdr lst) (- current 1))))

(define (countItems lst)
  (if (null? lst)
      0
      (+ 1 (countItems (cdr lst)))))

(define (swap lst idx1 idx2)
    (swapRec lst (findRec lst 0 idx1 idx2) 0 idx1 idx2))

(define (findRec lst current idx1 idx2)
  (cond ((null? lst) '())
        ((= current idx1) (cons (car lst) (findRec (cdr lst) (+ 1 current) idx2 idx2)))
        ((= current idx2) (car lst))
        (else (findRec (cdr lst) (+ 1 current) idx1 idx2))))

(define (swapRec lst elements current idx1 idx2)
  (cond ((null? lst) '())
        ((= current idx1) (cons (car (cdr elements)) (swapRec (cdr lst) elements (+ 1 current) idx1 idx2)))
        ((= current idx2) (cons (car elements) (cdr lst)))
        (else (cons (car lst) (swapRec (cdr lst) elements (+ 1 current) idx1 idx2)))))
 
; testing
;(heapsort '()) ;=> '()
;(heapsort '(1)) ;=> '(1)
;(heapsort '(1 2 3)) ;=> '(1 2 3)
;(heapsort '(4 3 2 1)) ;=> '(1 2 3 4)
(heapsort '(5 3 4 1 2)) ;=> '(1 2 3 4 5)