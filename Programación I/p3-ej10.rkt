; El estado del sistema será representado mediante un número.
; Si el número es par (impar), diremos que la persona está apoyando su pie izquierdo (derecho).
; Por otro lado, si el número es positivo (negativo), indica que la persona se estará desplazando
; desde la izquierda (derecha) hacia la derecha (izquierda).
; Los valores positivos indican la distancia recorrida en pixeles desde el estado inicial.
; Por otro lado, el valor absoluto de los valores negativos indican la distancia recorrida en pixeles
; desde el final de la escena.

;Constantes que definen la escena:
(define ANCHO 1000)
(define ALTO 300)
(define ESCENA (empty-scene ANCHO ALTO))


(define ST-INICIAL 50) ; Estado inicial del sistema 
(define VEL 73)  ; Distancia en pixeles que se desplazan los pies en cada paso

; Imagenes de las huellas

; NOTE A continuación deberían copiarse imágenes de los pies. Sin embargo, para evitar conflictos de
; versiones, utilizaremos triángulos rotados para simular las imágenes. Si lo desea, puede reemplazar
; los mismos por imágenes.

(define PIE-IZQ (rotate -90 (triangle 20 "solid" "gold")))
(define PIE-DER (rotate -90 (triangle 20 "solid" "blue")))

(define PIE-IZQ-VUELTA (rotate 180 PIE-IZQ))
(define PIE-DER-VUELTA (rotate 180 PIE-DER))

;-----------------------------------------------------------------------------------------------------

; render-state: Estado -> Image
; Recibe un estado y devuelve la interpretacion del mismo mediante una imagen.
; Si la posición es un número positivo, diremos que la persona se está desplazando de izquierda a
; derecha. Por el contrario, diremos que se desplaza de derecha a izquierda si la posición
; dada es negativa.
; La posición en pantalla viene dada por el valor absoluto del estado tomado desde el inicio si el
; estado es positivo y tomado desde el final si el estado es negativo.
(define (render-state st)
  (if(> st 0)
    (cond
      [(even? st) (place-image PIE-IZQ  st 130 ESCENA)]
      [(odd? st)  (place-image PIE-DER  st 170 ESCENA)])
    (cond
      [(even? st) (place-image PIE-DER-VUELTA (+ ANCHO st) 130 ESCENA)]
      [(odd? st)  (place-image PIE-IZQ-VUELTA (+ ANCHO st) 170 ESCENA)]
    )
  )
)

; handle-tick : Estado -> Estado
; Recibe un estado y con cada tick del reloj hace avanzar las huellas
; VEL unidades, manteniendolo en la escena
(check-expect (handle-tick 0) VEL)
(check-expect (handle-tick (- ANCHO 1)) (+ (- ANCHO 1) VEL))
(check-expect (handle-tick ANCHO) (- ST-INICIAL))
(check-expect (handle-tick (+ 1 (- ANCHO))) (- (+ 1 (- ANCHO)) VEL))
(check-expect (handle-tick (- ANCHO)) ST-INICIAL)
(define (handle-tick st)
  (cond
    [(and (>= st 0) (< st ANCHO)) (+ st VEL)]
    [(>= st 0) (- ST-INICIAL)]
    [(and (< st 0) (> st (- ANCHO))) (- st VEL)]
    [else ST-INICIAL]
  )
)


; handle-keypress : Estado Key -> Estado
; Recibe un estado y si se presiona la barra espaciadora vuelve al
; estado inicial
(check-expect (handle-keypress ST-INICIAL "k") ST-INICIAL)
(check-expect (handle-keypress 42 "p") 42)
(check-expect (handle-keypress ST-INICIAL " ") ST-INICIAL)
(check-expect (handle-keypress 42 " ") ST-INICIAL)
(define (handle-keypress st k)
  (cond
    [(key=? k " ") ST-INICIAL]
    [else st]
  )
)

; handle-mouse : Esado Number Number Event -> Estado
; Recibe un estado y un click y devuelve la posicion horizontal de
; dada por el click
(check-expect (handle-mouse ST-INICIAL (/ ANCHO 2) (/ ALTO 2) "button-down") (/ ANCHO 2))
(check-expect (handle-mouse ST-INICIAL (/ ANCHO 2) (/ ALTO 2) "button-up") ST-INICIAL)
(check-expect
 (handle-mouse (- ST-INICIAL) (/ ANCHO 2) (/ ALTO 2) "button-up") (- ST-INICIAL)
)
(check-expect (handle-mouse (- ST-INICIAL) (+ ANCHO 2) (/ ALTO 2) "button-down") (- ST-INICIAL))
(define (handle-mouse st x y click)
  (cond
    [(string=? click "button-down")
     (cond
       [(> x  ANCHO) st]
       [(>= st  0) x]
       [else (- x)]
     )]
    [else st]
  )
)



(big-bang ST-INICIAL
  [to-draw render-state]
  [on-key handle-keypress]
  [on-mouse handle-mouse]
  [on-tick handle-tick 0.5]
)
