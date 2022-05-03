;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practica_2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp")) #f)))
; distancia-origen: Number, Number -> Number
; Esta funcion calcula la distancia entre dos puntos (x, y)
(define (distancia-origen x y) (cond [(> x y) (- x y)]
                                     [(< x y) (- y x)]
                                     [else "Tipo de dato incorrecto"]))

; distancia-puntos: Number, Number, Number, Number -> String
; Esta función calcula la distancia entre dos puntos en un plano cartesiano utilizando el teorema de pitágoras
; Ej: Entrada: 0 0 1 1 Salida: 1.4142
; Ej: Entrada 3 3 3 3 Salida: 0
(define (distancia-puntos x1 y1 x2 y2)   (string-append "La distancia entre los puntos es: " (number->string
                                                                                              (sqrt (+ (sqrt (abs (- x2 x1))) (sqrt (abs (- y2 y1))))))))

; vol-cubo: Number -> Number
; Esta funcion calcula el volumen de un cubo
; Ej: Entrada: 3 Salida: 27
; Ej: Entrada: 2 Salida: 8
(define (vol-cubo x) (expt x 3))

; string-insert: String, Number -> String
; Esta funcion inserta un "-" en una posicion determinada de la string
; Ej: Entrada: "Hola Mundo" 4 Salida: "Hola- Mundo"
(define (string-insert str position) (string-append (substring str 0 position) "-" (substring str position (string-length str))))

; string-last: String -> String
; Esta funcion retorna el último caracter de una string no vacía
; Ej: Entrada: "Hola" Salida: "Hol"
(define (string-last str) (cond [(< 0 (string-length str))(substring str (- (string-length str) 1) (string-length str))]
                                [else "la String está vacía"]))

; string-remove-last: String -> String
; Esta funcion borra el último caracter de una string no vacía
; Ej: Entrada: "Hola" Salida: "Hol"
(define (string-remove-last str) (cond [(< 0 (string-length str))(substring str 0 (- (string-length str) 1))]
                                [else "la String está vacía"]))

; EJERCICIO 9

(define cuota 650)
(define dcto1 10)
(define dcto2 20)
(define dcto3 25)
(define dcto4 15)
(define dctoMax 35)

; calcDescuento: Number -> Number
; Esta funcion calcula el precio final con el descuento en funcion de la cuota y el tipo de descuento
(define (calcDescuento dcto) (- cuota (* (/ cuota 100) dcto)))

; monto-persona: Number, Number -> (Number | String)
; Esta funcion calcula el precio final en funcion de la cantidad de personas y las cuotas a abonar
(define (monto-persona cuotas cantidad) (cond [(= cantidad 1) cuota]
                                              [(= cantidad 2) (calcDescuento dcto1)]
                                              [(<= cantidad 3) (calcDescuento dcto2)]
                                              [(and (= 2 cuotas) (= cantidad 1)) (calcDescuento dcto4)]
                                              [(and (= 2 cuotas) (= cantidad 2)) (calcDescuento dcto3)]
                                              [(and (= 2 cuotas) (>= cantidad 3)) (calcDescuento dctoMax)]
                                              [(and (<= 3 cuotas) (= cantidad 1)) (calcDescuento dcto3)]
                                              [(and (<= 3 cuotas) (= cantidad 2)) (calcDescuento dctoMax)]
                                              [(and (<= 3 cuotas) (>= cantidad 3)) (calcDescuento dctoMax)]
                                              [else "Datos ingresados erróneos"]))
(monto-persona 4 4)



