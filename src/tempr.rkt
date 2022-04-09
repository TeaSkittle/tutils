#!/usr/bin/racket
#lang racket/base
(require racket/system)
(require "header.rkt")

; Only tested on my machine, could be different depending on number of cores

(define get-f "echo \"$(cat /sys/class/thermal/thermal_zone2/temp) * 0.001 * (9/5) + 32\" | bc -l")
(define get-c "echo \"$(cat /sys/class/thermal/thermal_zone2/temp) * 0.001\" | bc -l")

(displayln "CPU Temps")
(displayln "---------")
(lead-echo "Fahrenheit: " get-f)
(lead-echo "Celsius:    " get-c)
