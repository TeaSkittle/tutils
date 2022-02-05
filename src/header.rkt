#lang racket/base
(require racket/system)
(require racket/port)

; Will be renaming file, no idea what to call it yet

(provide (all-defined-out))

; Display while avoiding the "#t" printing
(define (system-display command)
  (display (with-output-to-string (lambda () command))))

; "Main" function for scripts, parse command line args
;
; Only works with one arg, need to make loop for more
(define (run fn)
  (if (= 0 (vector-length (current-command-line-arguments)))
    (exit)
    ; Loop here
    ; https://beautifulracket.com/explainer/loops.html
    (system-display (fn (vector-ref (current-command-line-arguments) 0)))))

; Have echo followed by command, helps clean up all the string-appends
(define (lead-echo str cmd)
  (system-display
   (system
    (string-append
     (string-append "echo -n '" str
                    (string-append "' ; " cmd))))))

