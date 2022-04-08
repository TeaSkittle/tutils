#!/usr/bin/racket
#lang racket/base
(require racket/system)
(require "header.rkt")

; W.I.P.

; Convert C to F
(define (convert c)
  (exact->inexact (+ (* c 9/5) 32)))

(define get-temps "cat /sys/class/thermal/thermal_zone*/temp")
