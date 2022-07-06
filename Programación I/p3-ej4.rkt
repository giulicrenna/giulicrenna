;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p3-ej4-SUBIR) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))

(define ANCHO 300);este es el ancho de la escena
(define ALTO 300);este es el alto de la escena
(define RADIO 40);este es el radio del círculo
(define DELTA 5);este es la amplitud del movimiento
(define POS-X (/ ANCHO 2)); esta es la posición en x del centro del círculo
(define POS-MIN RADIO); coordenada mínima admitida sobre el eje y para el centro del círculo para que no salga de la escena
(define POS-MAX (- ALTO RADIO)) ; coordenada máxima admitida sobre el eje y para el centro del círculo para que no salga de la escena


;El Estado del programa será un número que representa la posición en la vertical del
;círculo
(define ESTADO-INI (/ ALTO 2)); este es el estado inicial

;pantalla: Estado -> Imagen
;pantalla dibuja un círculo de radio RADIO centrado horizontalmente y en la posición
;vertical indicada por el Estado
(define (pantalla e)
  (place-image (circle RADIO "solid" "red") POS-X e (empty-scene ANCHO ALTO))
  )

;entra?: Estado -> Booleano
;entra? recibe un estado que representa la coordenada y del centro del círculo, y me dice si teniendo ese centro
;el círculo entra entero en la escena (devuelve en ese caso #t) o no (devuelve #f)
(check-expect (entra? POS-MAX) #t)
(check-expect (entra? POS-MIN) #t)
(check-expect (entra? (+ POS-MAX 10)) #f)
(check-expect (entra? (- POS-MIN 5)) #f)
(define (entra? e) (and (>= e POS-MIN) (<= e POS-MAX)))

;subir: Estado -> Estado
;subir recibe un estado y si el estado decrementado en DELTA es menor a la posición
;mínima lo limita a esa posición mínima, sino lo decrementa en DELTA
(check-expect (subir (- POS-MIN (- DELTA 1))) POS-MIN)
(check-expect (subir ESTADO-INI) (if (>= (- ESTADO-INI DELTA) POS-MIN) (- ESTADO-INI DELTA) POS-MIN))
(define (subir e)
  (if (entra? (- e DELTA)) (- e DELTA) POS-MIN)
)

;bajar: Estado -> Estado
;bajar recibe un estado y si el estado incrementado en DELTA es mayor a la posición
;máxima lo limita a esa posición máxima, sino lo incrementa en DELTA
(check-expect (bajar (+ POS-MAX (+ DELTA 1))) POS-MAX)
(check-expect (bajar ESTADO-INI) (if (<= (+ ESTADO-INI DELTA) POS-MAX) (+ ESTADO-INI DELTA) POS-MAX))
(define (bajar e)
  (if (entra? (+ e DELTA)) (+ e DELTA) POS-MAX)
)


;movimiento: Estado String -> Estado
;movimiento recibe el estado actual y un string que representa la tecla presionada
;y si la tecla presionada fue flecha arriba entonces decrementa el estado en DELTA,
;si la tecla presionada fue flecha abajo entonces incrementa el estado en DELTA
;COMPLETAR LOS CHECK-EXPECTS
;...........................
(define (movimiento e key)
  (cond [(key=? key "up") (subir e)]
        [(key=? key "down") (bajar e)]
        [(key=? key " ") ESTADO-INI]
        [else e])
  )


;COMPLETAR SIGNATURA, DECLARACIÓN DE PROPÓSITO, CHECK-EXPECT
;...........................
(define (mouse-handler e x y ev)
  (cond [(and (string=? ev "button-down")(entra? y)) y]
        [else e])
)



(big-bang ESTADO-INI
  [to-draw pantalla]
  [on-key movimiento]
  [on-mouse mouse-handler]
  )
