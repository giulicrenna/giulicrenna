;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname semaforo) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "elevator.rkt" "teachpack" "htdp")) #f)))

;A PARTIR DEL EJERCICIO 5 SURGIÓ LA IDEA DE IMPLEMENTAR UN SEMÁFORO
;ESTE ES EL RESULTADO OBTENIDO DURANTE LA CLASE

(define ANCHO 300) ; representa el ancho de la escena
(define ALTO 500) ; representa el alto de la escena
(define RADIO 50) ; representa el RADIO de cada uno de los 3 círculos del semáforo
(define CEN-X (/ ANCHO 2)) ; representa la coordenada sobre el eje x del centro de los 3 círculos
(define CEN-Y1 (/ ALTO 4)) ; representa la coordenada sobre el eje y del círculo más alto
(define CEN-Y2 (/ ALTO 2)) ; representa la coordenada sobre el eje y del círculo del medio
(define CEN-Y3 (* 3 (/ ALTO 4))) ; representa la coordenada sobre el eje y del círculo más bajo
(define FONDO (empty-scene ANCHO ALTO)) ;representa la escena vacía que usamos de fondo


;El Estado representa el tiempo desde el inicio de la secuencia
(define INI 0)

;circ: String -> Imagen
;circ toma un String que representa un color y devuelve un círculo de radio RADIO, relleno del color indicado
(define (CIRC c)
  (circle RADIO "solid" c))

;dib-circulos: String String String -> Imagen
;dib-circulos toma 3 Strings c1, c2 y c3 que son los 3 colores de los círculos
;y dibuja un círculo de radio RADIO en la posición (CEN-X, CEN-Y1) de color c1,
;otro del mismo RADIO en la posición (CEN-X, CEN-Y2) de color c2,
;un tercer círculo tb del mismo RADIO en la posición (CEN-X, CEN-Y3) de color c3,
;todos sobre el FONDO
(define (dib-circulos c1 c2 c3)
    (place-image (CIRC c1) CEN-X CEN-Y1
                 (place-image (CIRC c2) CEN-X CEN-Y2
                              (place-image (CIRC c3) CEN-X CEN-Y3 FONDO))))


;pantalla:Estado -> Imagen
;pantalla recibe un Estado que indica cuántos ticks pasaron desde el inicio de la secuencia
;y dependiendo del valor dibuja los círculos de distintos colores
;Si el valor del estado está en el rango [0,60) entonces dibuja el círculo de más arriba de color rojo y los otros dos negros
;Si el valor del estado está en el rango [60,90) entonces dibuja el círculo del medio de color amarillo y los otros dos negros
;Si el valor del estado está en el rango [90,150] entonces dibuja el círculo de más abajo de color verde y los otros dos negros
(define (pantalla e)
  (cond [(and (>= e 0) (< e 60)) (dib-circulos "red" "black" "black")]
        [(and (>= e 60) (< e 90)) (dib-circulos "black" "yellow" "black")]
        [(and (>= e 90) (<= e 150)) (dib-circulos "black" "black" "green")])
)

;avanza-reloj: Estado -> Estado
;avanza-reloj toma un estado que representa la cantidad de ticks que pasaron desde el inicio de la secuencia
;la secuencia total es de 150 ticks, si el valor del estado es menor a 150 lo incrementa en 1, sino lo resetea al valor inicial de 0
(check-expect (avanza-reloj 150) 0)
(check-expect (avanza-reloj 50) 51)
(define (avanza-reloj e)
  (if (> (+ e 1) 150) INI (+ e 1))
)

(big-bang INI
  [to-draw pantalla]
  [on-tick avanza-reloj]
)
