#!/usr/bin/racket
#lang racket/base


(require racket/system)

; W.I.P.

; Convert C to F
(define (convert c)
  (exact->inexact (+ (* c 9/5) 32)))

(define (get-temps)
  (system "cat /sys/class/thermal/thermal_zone*/temp"))
