(define llave "")
(define (setkey nueva)
  (set! llave nueva)
  (display "resultado >> nueva llave aceptada \n")
  (inicio)
  )

(define (quit)
  (display "Saliendo ... \n")
  (display "Gracias por usar nuestro codificador \n")
  )

(define (encode-text var2)
  (display var2)
  )

(define (decode-text var2)
  (display var2)
  )

(define (encode-file var2)
  (if (file-exists? var2)
      (begin
        (display "Si existe")
        )
      (invalido)
      )
  )

(define (decode-file var2)
  (if (file-exists? var2)
      (begin
        (display "Si existe")
        )
      (invalido)
      )
  )

(define (invalido)
  (display "ERROR: Expresión invalida \n")
  (inicio)
  )

(define (menu instruccion)
  (define pos 0)
  (define var "")
  (define var2 "")
  (do
      ([cont 0 (+ cont 1)])
      ((or (= cont (string-length instruccion))(equal? (substring instruccion cont (+ cont 1)) " ")) (set! pos cont))
      )
  (set! var (substring instruccion 0 pos))
  (if (not (= pos (string-length instruccion)))
      (set! var2 (substring instruccion (+ pos 1) (string-length instruccion)))
      )
  (cond 
    [(equal? "setkey" var)(setkey var2)]
    [(equal? "quit" var)(quit)]
    [(equal? "encode-text" var)(encode-text var2)]
    [(equal? "decode-text" var)(decode-text var2)]
    [(equal? "encode-file" var)(encode-file var2)]
    [(equal? "decode-file" var)(decode-file var2)]
    [else (invalido)]
  )
)

(define (inicio)
  (display "Codificador >> ")
  (define instruccion (read-line))
  (menu instruccion)
)

(inicio)
