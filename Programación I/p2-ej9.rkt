;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname PCA2-EJERCICIO9-SUBIR) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))
(define CUOTA 650) ;CUOTA representa el precio de la cuota en el instituto
(define DESC-PROMO1 10) ; PROMO 1 corresponde al % de descuento que se aplica si se inscriben 2 amigos
(define DESC-PROMO2 20) ; PROMO 2 corresponde al % de descuento que se aplica si se inscriben 3 o + amigos
(define DESC-PROMO3 15) ; PROMO 3 corresponde al % de descuento que se aplica si se abonan 2 meses juntos
(define DESC-PROMO4 25) ; PROMO 4 corresponde al % de descuento que se aplica si se abonan 3 o + meses juntos
(define DESC-MAX 35) ; DESC-MAX representa el % de decuento máximo a aplicar


; descuentoCantAlumnos: Number -> Number
; descuentoCantAlumnos recibe un numero que representa la cantidad de alumnos que se incriben
; y en función de eso devuelve un número que representa el porcentaje de descuento a aplicar
; a cada alumno
(check-expect (descuentoCantAlumnos 1) 0)
(check-expect (descuentoCantAlumnos 2) DESC-PROMO1)
(check-expect (descuentoCantAlumnos 4) DESC-PROMO2)
(define (descuentoCantAlumnos cant) (cond [(>= cant 3) DESC-PROMO2]
                                          [(>= cant 2 ) DESC-PROMO1]
                                          [else 0]))

; descuentoMeses: Number -> Number
; descuentoMeses recibe un numero que representa la cantidad de meses que se abonan
; y en función de eso devuelve un número que representa el porcentaje de descuento a aplicar
; a cada alumno
(check-expect (descuentoMeses 1) 0)
(check-expect (descuentoMeses 2) DESC-PROMO3)
(check-expect (descuentoMeses 5) DESC-PROMO4)
(define (descuentoMeses meses) (cond [(>= meses 3) DESC-PROMO4]
                                     [(>= meses 2 ) DESC-PROMO3]
                                     [else 0]))


; montoPersona: Number Number -> Number
; montoPersona recibe un número que representa la cantidad de personas que se inscriben, otro número que representa
; la cantidad de meses que abonan y devuelve el monto a pagar por persona
; sabiendo que existe un descuento máximo a aplicar de DESC-MAX
(check-expect (montoPersona 2 2) (/ (* (- 100 (+ DESC-PROMO1 DESC-PROMO3)) CUOTA 2) 100))
(check-expect (montoPersona 3 3) (/ (* (- 100 DESC-MAX) CUOTA 3) 100))
(define (montoPersona pers meses) (cond [(> (+ (descuentoCantAlumnos pers) (descuentoMeses meses)) DESC-MAX) (/ (* (- 100 DESC-MAX) CUOTA meses) 100)]
                                        [else (/ (* (- 100 (+ (descuentoCantAlumnos pers) (descuentoMeses meses))) CUOTA meses) 100)]
                                       ))

