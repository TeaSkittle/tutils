#lang racket/base
(require racket/string)
(require shell/pipeline)
(require "header.rkt")

; Convert Shell command for use in shell/pipeline
; The command must be wrapped in ' '
;
; Example Input:
;   $ piper 'awk "{print $9}" | tail -n +2'
; Example Output"
;   $ '(awk "{print $9}" )'( tail -n +2)

(define (convert l)
  (for ([i (string-split l "|")])
    (display "'")
    (display (list i)))
  (newline))

(run convert)
