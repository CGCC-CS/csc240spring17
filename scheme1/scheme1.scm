#lang scheme

; Imperative style:
;    x = something
;    y = change(x)
;    result = calculate(y)
; Functional style:
;    calculate(change(something))

; Scheme forms are something you ask Scheme to evaluate

; Comments start with a semi-colon
#;(define ignore
  (lambda (x)
    (* x 0)))

(newline)

"Data types"
"Hello, world"   ; string
'HelloWorld      ; symbol
+                ; primitive
#t               ; boolean
#f               ; boolean
#\A              ; character

(newline)
"Numeric data types:"
3      ; integer
#b101  ; binary
#x101  ; hexidecimal
#o101  ; octal
12.3   ; real
7/3    ; fractions
4+2i   ; imaginary

(newline)
"Number predicates"
(integer? 3)
(integer? 3.0)
(real? 3)
(real? 3.0)
(rational? 1/3)
(complex? 2+i)
(real? 2+i)
(real? 2+0i)

(newline)
"Math"
(+ 10 10)
(* 10 10)
(+ 1 2)
(* 3 4)
(+ 1 2 3 4 5 6 7 8 9 10)
(* 1 2 3 4 5 6 7 8 9 10)
(* (/ (* 7 (- 8 2)) (/ (* 6 3) (* 2 2 3 (/ 1 2)))) 2)

(newline)
"Define x, y, & z"
(define x 10)
(define y 20)
(define (z) 30)
x
y
z
(z)

(newline)
"Define a procedure"
(* 3 x)
(lambda (x) (* 3 x))    ; unnamed procedure
((lambda (x) (* 3 x)) 5)
((lambda (x) (* 3 x)) y)
(define trip       ; define associates a name with an expression
  (lambda (x)      ; lambda defines a procedure
    (* 3 x)))      ; this form assoicates the name "trip" with 
                   ; the lambda expression
trip
(trip 9)
(trip y)
(+ x y (trip 5))

; define a parameter with 2 parameters
(define addem
  (lambda (a b)
    (+ a b)))
(addem x y)
(addem 3 (addem 4 2))

(newline)
"function as a parameter"
(define increment
  (lambda (x)
    (+ x 1)))
(increment 4)
(increment x)
(define do
  (lambda (this that)
    (this that)))
(do increment 8)
(do trip 10)
(do (lambda (x) (* 2 x)) 10)
;(do 3 4)
;(do addem 4)

(newline)
"Recursion"
(define fact
  (lambda (n)
    (if (<= n 1)  ; (if condition evaluate-if-true evaluate-if-false)
        1
        (* n (fact (- n 1))))))
(fact 10)
(fact 30)
(fact 100)
;(fact 1000)

"tail-recursion"
(define fact-tail
  (lambda (n)
    (fact-tail-acc n 1)))
(define fact-tail-acc
  (lambda (n acc)
    (if (<= n 1)
        acc
        (fact-tail-acc (- n 1) (* n acc)))))
(fact-tail 500)

(newline)
"Lists"
(list x y z)
(list 'x 'y 'z)    ; ' means "do not evaluate"
'(x y z)
(quote (x y z))
(quote z)
(define lst '(a b c))
(define lst2 (list 'a 2 "hello" 'world / #f + fact-tail 18 'a #\H))
(define oplist (list + / -))
lst
lst2
oplist

(newline)
"quote vs list"
(+ 1 2)         ; evaluate the operator + on the operands 1 & 2
'(+ 1 2)        ; do not evaluate - treat like a list
(list + 1 2)    ; add +, 1 & 2 to a list

(newline)
"list operations"
lst
(car lst)
(cdr lst)
(car (cdr lst))
(cdr (cdr lst))
(car (cdr (cdr lst)))
(cdr (cdr (cdr lst)))
;
(cadr lst)
(cddr lst)
(caddr lst)
(cdddr lst)
;(cdr '())
(newline)
(cdr '(1))
(car '((4 5 6)))
(car (car '((4 5 6))))

(newline)
"Fun with car & cdr)"
(define lst3 '((1 2) (3 4 (5 6)) (7 8)))
lst3
(cdr lst3)
(car (cdr lst3))
(car (car (cdr lst3)))
(cdr (car (cdr lst3)))
(car (cdr (car (cdr lst3))))
(cdr (cdr (car (cdr lst3))))
(car (cdr (cdr (car (cdr lst3)))))
(cdr (cdr (cdr (car (cdr lst3)))))
(car (car (cdr (cdr (car (cdr lst3))))))
(cdr (car (cdr (cdr (car (cdr lst3))))))
(car (cdr (car (cdr (cdr (car (cdr lst3)))))))

(newline)
"List with size 1"
(car '(1))
(cdr '(1))

(newline)
"Checking equality"
(= 32 32)
(eq? 32 32)
(equal? 32 32)
(equal? 32 34)
(newline)
(eq? 'X 'X)
(eq? '(1 2 3) '(1 2 3))
(equal? 'X 'X)
(equal? '(1 2 3) '(1 2 3))
(= 32 (* 4 8))
(= '32 (* 4 8))

(newline)
"Symbols & Strings"
(symbol? "hello")
(string? "hello")
(symbol? 'hello)
(string? 'hello)
(symbol->string 'hello)
(string->symbol "hello")

(newline)
"Cool example"
oplist
(car oplist)
((car oplist) 1 2 3)
((cadr oplist) 24 7)