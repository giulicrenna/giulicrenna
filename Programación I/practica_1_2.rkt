;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practica_1_2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp")) #f)))
;EJ 1
(define (sgn2 x) (cond [(> x  0) 1]
  [(< x 0) -1]
  [(= x 0) 0]))

;EJ 2
(define (imgClas img) (cond [(< (image-width img) 1024) "Ancha"]
                            [else "Angosta"]))

(define (esunTrian? a b c) (cond [(=(+ a b c) 180) #false]
                                [else #true]))

(define (trianClas a b c) (cond [(esunTrian? a b c) "No es un triángulo"]
                                [(= a b c) "Equilatero"]
                                [(or (= a b) (= b c) (= a c)) "Isoceles"]
                                [(not(= a b c)) "Escaleno"]
                                [else "Wrong Data Baby"]))

(define (pitagoras x y z) (cond [(= (+(sqr x) (sqr y)) (sqr z)) "Es una terna pitagórica"]
                                [else "No es una terna pitagórica"]))

;EJ 4
(define (imgClas2 imagen) (cond [(> (image-width imagen) (* 2 (image-height imagen))) "Muy Ancha"]
                                [(< (* 2(image-width imagen)) (image-height imagen)) "Muy Angosta"]
                                [(= (image-width imagen) (image-height imagen)) "Cuadrada"]
                                [(> (image-width imagen) (image-height imagen)) "Ancha"]
                                [(< (image-width imagen) (image-height imagen)) "Angosta"]
                                [else "Tipo de dato incorrecto" ]))

;EJ 5
(define (clasificar t) (cond [(<= t 0) "Muy frío (MF)"]
                             [(and (> t 0) (<= t 15)) "Frío (F)"]
                             [(and (> t 15) (<= t 25)) "Agradable (A)"]
                             [(> t 25) "Caluroso (C)"]))
;EJ 6
