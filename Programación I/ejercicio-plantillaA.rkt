;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ejercicio-plantillaA) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; estado del sistema:
(define-struct estado [color angulo rotacion])
; estado es (make-estado (String, Number, String)).
; Interpretación: la estructura estado recibe el color
; del cuadrado, su ángulo de rotación, y si rota automáticamente con cada tick de reloj
; "on" -> rotacion automática "off" -> no rotación automática

; constantes
(define ALTO 300)
(define ANCHO 300)
(define GRADOS-POR-TICK 5)
(define COLOR-FONDO "green")
(define LADO 50)
(define INIT (make-estado "red" 0 "on")) ; estado inicial
(define SCENE (empty-scene ALTO ANCHO COLOR-FONDO))
(define posInicialX (/ ANCHO 2))
(define posInicialY (/ ALTO 2))

; dibujar : estado -> imagen
; esta funcion se encarga de dibujar el cuadrado en el centro de la escena
;(check-expect (dibujar (make-estado "red" 30 "on")) (rotate 30 (square LADO "solid" "red")))
;(check-expect (dibujar (make-estado "blue" 70 "on")) (rotate 70 (square LADO "solid" "blue")))
(define (dibujar e) (place-image
                     (rotate (estado-angulo e) (square LADO "solid" (estado-color e)))
                                 posInicialX posInicialY
                                 SCENE))

; key-handler : estado key -> estado
; esta funcion activa o desactiva la rotación automática si se presiona la barra espaciadora
(define (key-handler e k) (cond [(and (key=? " " k) (string=? (estado-rotacion e) "on")) (make-estado (estado-color e) (estado-angulo e) "off")]
                                [(and (key=? " " k) (string=? (estado-rotacion e) "off")) (make-estado (estado-color e) (estado-angulo e) "on")]
                                [(key=? "y" k) (make-estado "yellow" (estado-angulo e) (estado-rotacion e))]
                                [(key=? "r" k) (make-estado "red" (estado-angulo e) (estado-rotacion e))]
                                [(key=? "b" k) (make-estado "blue" (estado-angulo e) (estado-rotacion e))]
                                [else (make-estado (estado-color e) (estado-angulo e) (estado-rotacion e))]))

; sumarAng : Number, Estado -> Number
(define (sumarAng n e) (+ n e))

; actualizar-angulo : estado -> estado
; responde al tick del reloj
(define (actualizar-angulo e) (cond [(string=? (estado-rotacion e) "on") (if (not (= (estado-angulo e) 358))
                                                                     (make-estado (estado-color e) (sumarAng 5 (estado-angulo e)) "on")
                                                                     (make-estado (estado-color e) 3 "on"))]
                                      [else (make-estado "red" (estado-angulo e) "off")]))
(big-bang INIT
          [on-tick actualizar-angulo]
          [on-key  key-handler]
          [to-draw dibujar])