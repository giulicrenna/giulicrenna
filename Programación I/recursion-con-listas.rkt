;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname recursoin-con-listas) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Probando recursion
(define Milista (cons 1 (cons 2 (cons 3 (cons 100 '())))))

; sumaLista: Lista() -> Number
; Esta funcion suma todos los elementos de la lista
(check-expect (sumaLista '()) 0)
(define (sumaLista lista) (cond [(cons? lista) (+ (first lista) (sumaLista (rest lista)))]
                                [(empty? lista) 0]))

; predL: Lista() -> Lista()
; Esta funcion devuelve los predecesores de los elementos de la lista
(check-expect (predL (list 1 2 3)) (list 0 1 2))  
(define (predL lista) (cond [(cons? lista) (cons (- (first lista) 1) (predL (rest lista)))]
                                [(empty? lista) '()]))

; mayor1?: Lista(Number) -> Boolean
; Esta funcion devuelve #true si en la lista hay algún elemento mayor a 1, en caso
; contrario devuelve #false
(check-expect (mayor1? (list 4 5)) #t)
(define (mayor1? lista) (cond [(empty? lista) #f]
                                [(and (cons? lista) (< 1 (first lista))) #t]
                                [(and (cons? lista) (>= (first lista) 1)) (mayor1? (rest lista))]))

; no3: Lista(Number) -> Lista(Number)
; esta funcion nos devuelve una lista igual sin el número 3
(check-expect (no3 (list 1 4 3 7 3)) (list 1 4 7))
(define (no3 lista) (cond [(empty? lista) empty]
                          [(and (cons? lista) (not (= (first lista) 3))) (cons (first lista) (no3 (rest lista)))]
                          [(and (cons? lista) (= (first lista) 3)) (no3 (rest lista))]))

; Gastos es:
; '()
; (cons Number Gastos)
;
; Interpretación: Gastos representa los precios de los productos comprados.
(define Gastos (list 134 356 211))

; mas300?: Lista(Number) -> Boolean
; Esta funcion devolverá #true si algún producto nos costó más de 300$
; en caso contrario devolverá false.
(check-expect (mas300? (list 20 235 145)) #f)
(define (mas300? lista) (cond [(empty? lista) #f]
                        [(and (cons? lista) (<= 300 (first lista))) #t]
                        [(and (cons? lista) (> 300 (first lista))) (mas300? (rest lista))]))
