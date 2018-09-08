;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname digitfunctions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-type LoD [Listof Char])

(: num->digits : Number -> LoD)
;Turns a number into a list of characters, wherein each character is a digit
(define (num->digits n)
  (string->list (number->string n)))

(module+ test
  (check-equal? (num->digits 10) (list #\1 #\0)))

(: 2? : Char -> Boolean)
;Checks to see if a given character equals #\2
(define (2? char)
  (char=? #\2 char))

(module+ test
  (check-equal? (2? #\2) #true))
(module+ test
  (check-equal? (2? #\3) #false))
(module+ test
  (check-equal? (2? #\a) #false))

(: numof2 : Number -> Number)
;Counts the number of 2s in any given number
(define (numof2 n)
  (length (filter 2? (num->digits n))))

(module+ test
  (check-equal? (numof2 22222) 5))
(module+ test
  (check-equal? (numof2 67813) 0))
(module+ test
  (check-equal? (numof2 67822) 2))
  
(: numofd : Number Number -> Number)
;Counts the number of a given digit in any given number
(define (numofd d n)
  (length (filter (lambda ([x : Char])
                    (char=? (first(num->digits d)) x))(num->digits n))))
(module+ test
  (check-equal? (numofd 3 4567) 0))
(module+ test
  (check-equal? (numofd 3 4363) 2))
(module+ test
  (check-equal? (numofd 8 18087148) 3))
