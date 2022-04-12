;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practica_1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp")) #f)))
; EJERCICIO 1
(define (imagen img) (if (< (image-width img) 1024) "angosta" "ancha"))

; EJERCICIO 2
(define (imagen_2 img) (if (= (image-width img) (image-height img)) "cuadrada" (if (< (image-width img) 1024) "angosta" (if (> (image-width img) 1024) "ancha" #f))))

; EJERCICIO 3
(define (triangulos a b c) (if (= a b c) "equilatero" (if (or (= a b) (= b c) (= c a)) "isoceles" "escaleno")))

; EJERCICIO 4
(define (triangulos_except a b c) (if (< 180 (+ a b c)) "Triángulo incompatible" (if (= a b c) "equilatero" (if (or (= a b) (= b c) (= c a)) "isoceles" "escaleno"))))

; EJERCICIO 5
(define PC 60)
(define PL 8)
(define DC 10)
(define DL 15)
(define (descuento_Cuadernos cant)
  (if (>= cant 4) (- (* PC cant) (* PC cant (/ DC 100))) (string-append "No hay descuento, paga: " (number->string (* cant PC)))))
(define (descuento_Lapices cant)
  (if (>= cant 5) (- (* PL cant) (* PL cant (/ DL 100))) (string-append "No hay descuento, paga: " (number->string (* cant PL)))))

; EJERCICIO 6
(define PC2 60)
(define PL2 8)
(define DC2 10)
(define DL2 15)
(define DM 18)
(define (descuento_Cuadernos2 cant)
  (if (>= cant 10) (string-append "Descuento mejor: " (number->string (- (* PC2 cant) (* PC cant (/ DM 100)))))
      (if (>= cant 4) (- (* PC2 cant) (* PC2 cant (/ DC2 100))) (string-append "No hay descuento, paga: " (number->string (* cant PC2))))))
(define (descuento_Lapices2 cant)
  (if (>= cant 10) (string-append "Descuento mejor: " (number->string (- (* PC2 cant) (* PC cant (/ DM 100)))))
      (if (>= cant 5) (- (* PL2 cant) (* PL2 cant (/ DL2 100))) (string-append "No hay descuento, paga: " (number->string (* cant PL2))))))

; EJERCICIO 7
(define (pitagoras x y z) (if (= (+ (sqr x) (sqr y)) (sqr z)) "Es una terna pitagórica" "No es una terna pitagórica"))

; EJERCICIO 8
(define (pitagoras2 x y z)
  (if (= (+ (sqr x) (sqr y)) (sqr z)) (string-append (number->string x) " " (number->string y) " " (number->string z) ": Es una terna pitagórica") "No es una terna pitagórica"))

; EJERCICIO 9
(define (collatz n) (if (integer? (/ n 2)) (/ n 2) (+ (* 3  n) 1))) 

; EJEMPLO
(define ejemplo (place-image (rectangle 90 30 "solid" "red") 45 15
                             (place-image (circle 10 "solid" "blue") 45 45 (empty-scene 90 60))))

; EJERCICIO 10
(define italia (place-image (rectangle 30 60 "solid" "green")  15 30
                            (place-image (rectangle 30 60 "solid" "white") 45 30
                                         (place-image (rectangle 30 60 "solid" "red") 75 30 (empty-scene 90 60)))))

(define peru (place-image (rectangle 30 60 "solid" "red")  15 30
                            (place-image (rectangle 30 60 "solid" "white") 45 30
                                         (place-image (rectangle 30 60 "solid" "red") 75 30 (empty-scene 90 60)))))

(define alemania (place-image (rectangle 90 20 "solid" "black")  45 10
                            (place-image (rectangle 90 20 "solid" "red") 45 30
                                         (place-image (rectangle 90 20 "solid" "yellow") 45 50 (empty-scene 90 60)))))

(define holanda (place-image (rectangle 90 20 "solid" "red")  45 10
                            (place-image (rectangle 90 20 "solid" "white") 45 30
                                         (place-image (rectangle 90 20 "solid" "blue") 45 50 (empty-scene 90 60)))))

(define (generic color1 color2 color3) (place-image (rectangle 90 20 "solid" color1)  45 10
                            (place-image (rectangle 90 20 "solid" color2) 45 30
                                         (place-image (rectangle 90 20 "solid" color3) 45 50 (empty-scene 90 60)))))

(define (generic_Rotated color1 color2 color3 rot) (if (string=? rot "rotate") (place-image (rotate 90 (rectangle 60 30 "solid" color1))  15 30
                            (place-image (rotate 90 (rectangle 60 30 "solid" color2)) 45 30
                                         (place-image (rotate 90 (rectangle 60 30 "solid" color3)) 75 30 (empty-scene 90 60)))) (if (string=? rot "norotate") (place-image (rectangle 90 20 "solid" color1)  45 10
                            (place-image (rectangle 90 20 "solid" color2) 45 30
                                         (place-image (rectangle 90 20 "solid" color3) 45 50 (empty-scene 90 60)))) "Rotación incorrecta (rotate o norotate)" )))

(define argentina (place-image (radial-star 32 30 8 "solid" "yellow") 45 30 (place-image (rectangle 90 20 "solid" "lightblue")  45 10
                            (place-image (rectangle 90 20 "solid" "white") 45 30
                                         (place-image (rectangle 90 20 "solid" "lightblue") 45 50 (empty-scene 90 60))))))

(define camerun (place-image (rotate 270 (triangle 60 "solid" "green")) 25 30 (place-image (rectangle 90 20 "solid" "red")  45 10
                            (place-image (rectangle 90 20 "solid" "white") 45 30
                                         (place-image (rectangle 90 20 "solid" "black") 45 50 (empty-scene 90 60))))))

(define brazil (place-image (circle 10 "solid" "blue")  45 30
                            (place-image (rotate 90 (rhombus 45 60 "solid" "yellow")) 45 30
                                         (place-image (rectangle 90 60 "solid" "green") 45 30 (empty-scene 90 60))))) 

(define francia (generic_Rotated "blue" "white" "red" "rotate"))