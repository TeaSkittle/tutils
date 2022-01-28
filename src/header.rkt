#lang racket/base
(require racket/port)

; Will be renaming file, no idea what to call it yet

(provide (all-defined-out))

; Display as string, avoiding "#t" retun value printing
(define (system-display command)
        (display (with-output-to-string (lambda () command))))
