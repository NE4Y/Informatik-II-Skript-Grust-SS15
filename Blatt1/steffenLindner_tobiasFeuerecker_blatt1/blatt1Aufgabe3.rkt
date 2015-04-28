;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "DMdA-beginner-reader.ss" "deinprogramm")((modname blatt1Aufgabe3) (read-case-sensitive #f) (teachpacks ((lib "image2.rkt" "teachpack" "deinprogramm"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image2.rkt" "teachpack" "deinprogramm")))))
; Steffen Lindner, Tobias Feuerecker
; Blatt 1
; Aufgabe 2

; Berechnet die zweidimensionale Fläche eines Würfels
; mit der Kantenlänge k
(: cube-area (real -> real))
(check-expect (cube-area 2) 8)
(check-expect (cube-area 3) 18)
(define cube-area
  (lambda (k)
    (* 2 k k)))

; Zeichnet 2 überlappende Quadrate der Kantenlänge k
(: draw-squares (real -> image))
(define draw-squares
  (lambda (k)
    (clear-pinhole
      (overlay/pinhole
        (square k "outline" "black")
          (put-pinhole k 0 (square k "outline" "black"))))))

     
; Zeichnet 4 (bzw. 2x2) parrallele Linien
(define draw-line 
  (lambda (k)
    (clear-pinhole
     (overlay/pinhole
       (put-pinhole 0 0 (line  (/ k -2) (/ k 2) "black"))
       (put-pinhole k 0 (line (/ k -2) (/ k 2) "black"))
       (put-pinhole k k (line (/ k -2) (/ k 2) "black"))
       (put-pinhole 0 k (line (/ k -2) (/ k 2) "black"))))))


; Zeichnet einen dreidimensionalen Würfel mit der Kantenlänge k
(: draw-cube (real -> image))
(define draw-cube 
  (lambda (k)
    (clear-pinhole
      (overlay/pinhole
        (draw-squares k)
        (draw-line k)))))

; Beispiele
(draw-cube 100)
(draw-cube 50)
    