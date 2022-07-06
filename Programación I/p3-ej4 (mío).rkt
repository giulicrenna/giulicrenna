;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |p3-ej4 (mío)|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ANCHO 500)
(define ALTO 500)
(define INICIAL (/ ALTO 2))
(define DELTA 2)
(define RADIO 35)
(define ESCENA_VACIA (empty-scene 500 500))
(define POSX (/ ANCHO 2))
(define POSY (/ ALTO 2))
(define POS-MIN RADIO)
(define POS-MAX (- ALTO RADIO))


(check-expect (manejador-pantalla 5) (place-image (circle RADIO "solid" "red") POSX 5 ESCENA_VACIA))
(check-expect (manejador-pantalla 20) (place-image (circle RADIO "solid" "red") POSX 20 ESCENA_VACIA))
; manejador-pantalla : estado -> estado
; Esta funcion se encarga de dibujar un circulo rojo de un radio determinado
; en una escena vacía, esta es la función que se encargará de manejar los eventos de
; pantalla.
(define (manejador-pantalla estado) (place-image (circle RADIO "solid" "red") POSX estado ESCENA_VACIA))

(check-expect (limites 50) #t)
(check-expect (limites 5000) #f)
; limites : Number -> Boolean
; Esta función se encarga de determinar si la posición
; del circulo está dentro de los límites de la pantalla
; esta función devolverá un valor booleano
(define (limites n) (and (<= n POS-MAX) (>= n POS-MIN)))

(check-expect (subir 50) 48)
; subir :  Number -> Number
; Esta función se encarga de incrementar la posicion
; en un valor DELTA si la circunferencia se encuentra dentro de la pantalla
(define (subir n) (if (limites n) (- n DELTA) POS-MIN))

(check-expect (bajar 50) 52)
; bajar :  Number -> Number
; Esta función se encarga de decrementar la posicion
; en un valor DELTA si la circunferencia se encuentra dentro de la pantalla
(define (bajar n) (if (limites n) (+ n DELTA) POS-MAX))

(check-expect (manejador-teclado 50 "up") 48)
; manejador-teclado : Estado, String -> Estado
; Esta funcion se encarga de manejar los eventos de teclado,
; si se presiona la tecla flecha arriba la circunferencia subirá
; con la flecha hacia abajo la circunferencia bajará y con el espacio
; volverá a su posición inicial.
(define (manejador-teclado estado tecla) (cond [(key=? tecla "up") (subir estado)]
                                         [(key=? tecla "down") (bajar estado)]
                                         [else (/ POS-MAX 2)]))


(define (mouse-handler n x y event) (cond [(string=? event "button-down") y]
                                          [else n]))

(big-bang INICIAL
  [to-draw manejador-pantalla]
  [on-key manejador-teclado]
  [on-mouse mouse-handler])
