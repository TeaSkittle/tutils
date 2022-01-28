#lang racket/base
(require racket/port)

; Will be reanming file, no idea what to call it yet

(provide (all-defined-out))

(define (system-display command)
        (display (with-output-to-string (lambda () command))))

