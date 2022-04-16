#lang racket/base
(require racket/string)
(require shell/pipeline)
(require "header.rkt")

; Convert Shell command for use in shell/pipeline
; The command must be wrapped in quotes
;
; Example Input:
;   $ piper "echo \"Hello, World!\" | awk '{print \$1}'"
;
; Example Output"
;   $ '(echo "Hello, World!")'(awk '{print $1}')
;
; In above example you need to have \ infront of $, awk is a bit weird here

(define (convert l)
  (for ([i (string-split l "|")])
    (display "'")
    (display (list i)))
  (newline))

(run convert)
