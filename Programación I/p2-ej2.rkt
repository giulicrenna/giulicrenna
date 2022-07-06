;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p2-ej2-SUBIR) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))

;representamos coordenadas en el plano x y usando números

;distancia-puntos: Número Número Número Número -> Número
;la función distancia-puntos recibe 4 números x1,y1,x2,y2 y calcula
;la distancia entre los puntos (x1,y1) y (x2,y2)
(check-expect (distancia-puntos 0 0 0 1) 1)
(check-expect (distancia-puntos 0 0 2 0) 2)
;AGREGAR ALGÚN OTRO EJEMPLO QUE NO ESTÉ SOBRE LOS EJES
(define (distancia-puntos x1 y1 x2 y2)
           (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1)))))
