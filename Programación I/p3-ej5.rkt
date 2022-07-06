;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p3-ej5-SUBIR) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))

(define ANCHO 300); representa el ancho de la escena
(define ALTO 300); representa el alto de la escena
(define RADIO 50); representa el radio del círculo
(define CEN-X (/ ANCHO 2)); representa la coordenada sobre el eje x del centro del círculo
(define CEN-Y (/ ALTO 2)); representa la coordenada sobre el eje y del centro del círculo
(define FONDO (empty-scene ANCHO ALTO)); representa la escena vacía que usamos de fondo

;El Estado representa el color del círculo central
(define INI "yellow")


;pantalla:Estado -> Imagen
;pantalla recibe un color y dibuja un círculo de dicho color de radio RADIO en las coordenadas (CEN-X, CEN-Y)
;sobre de la escena que usamos de fondo
(define (pantalla e)
  (place-image (circle RADIO "solid" e) CEN-X CEN-Y FONDO)
)

;parpadeo: Estado -> Estado
;parpadeo define en función del color del estado actual el próximo color:
;Sigue esta secuencia amarillo-> rojo->verde->azul-> amarillo-> ....
(check-expect (parpadeo "yellow") "red")
(check-expect (parpadeo "green") "blue")
(define (parpadeo e)
  (cond [(string=? e "yellow") "red"]
        [(string=? e "red") "green"]
        [(string=? e "green") "blue"]
        [(string=? e "blue") "yellow"]
  )
)

(big-bang INI
  [to-draw pantalla]
  [on-tick parpadeo]
)
