#lang scheme

(define a 1)
(define b a)
(define c (+ a b))
a
b
c

(* -1 c)
(- c)

(define opposite
  (lambda (x)
    (- x)))
(opposite -10)
(opposite (opposite 12))

(newline)
"null"
null
(null? 3)
(null? 0)
;(null? ())
(null? '())

(newline)
"Tail recursive Fibonacci implementation"
(define fib-tail
  (lambda (x)
    (fib-tail-acc x 0 1)))
(define fib-tail-acc
  (lambda (x f2 f1)
    (if (<= x 2)
        (+ f1 f2)
        (fib-tail-acc (- x 1) f1 (+ f1 + f2)))))

(newline)
"Elements in a list"
(define isit-lst0 (+ 2 3))
(define isit-lst1 '(+ 2 3))
(define isit-lst2 (list + 2 3))
(define isit-lst3 (list (+ 2 3)))
(define isit-lst4 (list '(+ 2 3)))
isit-lst0
isit-lst1
isit-lst2
isit-lst3
isit-lst4
(length isit-lst4)
(car isit-lst1)
(car isit-lst2)
;((car isit-lst1) 8 9 10)
((car isit-lst2) 8 9 10)

;       +                    2                      3
((car isit-lst2) (car (cdr isit-lst2)) (car (cdr (cdr isit-lst2))))

(newline)
"More lists"
(define exlst0 (list 2 3))
(define exlst1 (list list 2 3))
(define exlst2 (list list 2 3 (list + 2 3) (+ 2 3)))
(define exlst3 '(list 2 3 (list + 2 3) (+ 2 3)))
exlst0
exlst1
exlst2
exlst3

(newline)
"Conditional statement"
(define what-is-it?
  (lambda (x)
    (cond
      ((not (number? x)) "Not a number")
      ((< x 0) "Negative")
      ((= x 0) "Zero")
      (else "Positive"))))
(what-is-it? 2)
(what-is-it? +)
(what-is-it? -4)


(define return-something
  (lambda (x)
    (cond
      ((> x 11) 10)
      ((= (remainder x 2) 0) 2)
      ((> x 5) 5)
      (#t 0))))
(return-something 20)
(return-something 8)
(return-something 7)
(return-something 3)

(newline)
"Recursion"
(define increment
  (lambda (x)
    (+ x 1)))
(define decrement
  (lambda (x)
    (- x 1)))
(increment 10)
(decrement 10)
; Only works for positive #'s
(define recursive-add
  (lambda (x y)
    (if (<= y 0)
        x
        (recursive-add (increment x) (decrement y)))))
(recursive-add 3 4)
(recursive-add 10 15)
        

(newline)
"Lists"
(car '(a))
(cdr '(a))
(cons 'b '(a))
(define lst '(1 2 3 4))
lst
(car lst)
(cdr lst)
(cons 0 lst)
(car (cons 0 lst))
(cdr (cons 0 lst))
(cons '(a b c) lst)
(cons lst lst)
(append '(a b c) lst)
(append lst lst)

(newline)
"List procedures"
lst
(define non-empty-list?
  (lambda (lst)
    (if (or (not (list? lst)) (null? lst))
        #f
        #t)))
(non-empty-list? 'list)
(non-empty-list? '())
(non-empty-list? lst)

(define sumlist
  (lambda (lst)
    (if (or (not (list? lst)) (null? lst))
        0
        (+ (car lst) (sumlist (cdr lst))))))
(sumlist lst)

(define do-nothing
  (lambda (lst)
    (if (not (non-empty-list? lst))
        lst
        (cons (car lst) (do-nothing (cdr lst))))))
(do-nothing '())
(do-nothing lst)

(define double (lambda (x) (* x 2)))
(define doublelist
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (double (car lst)) (doublelist (cdr lst))))))
(doublelist lst)

(define sum-doublelist
  (lambda (lst)
    (if (null? lst)
        0
        (+ (double (car lst)) (sum-doublelist (cdr lst))))))
(sum-doublelist lst)

(define better-sum-doublelist
  (lambda (lst)
    (sumlist (doublelist lst))))
(better-sum-doublelist lst)

(define allnums
  (lambda (lst)
    (if (null? lst)
        lst
        (if (number? (car lst))
            (cons (car lst) (allnums (cdr lst)))
            (allnums (cdr lst))))))
;(allnums 'numbers)
(allnums '('hello 'world))
(allnums (list a b c 'd 'e 'f 1 2 3 'hello '(4 5 6) + - (+ 2 3)))
(sum-doublelist (allnums (list a b c 'd 'e 'f 1 2 3 'hello '(4 5 6) + - (+ 2 3))))

(newline)
"Pairs"
(cons 1 '(2))
(cons 1 2)
(car '(1 . 2))
(cdr '(1 . 2))
(pair? '(1 . 2))
(pair? '(1 2))
(define pair1 '(a . b))    ;[ a . b]
(define pair2 '(a . (b)))
(define pair3 '(a b))      ;[ a . [ b . () ] ]
pair1
pair2
pair3
(car pair1)
(cdr pair1)
(cons 'a 'b)
(cons 'a '())
(cons 'a (cons 'b '()))