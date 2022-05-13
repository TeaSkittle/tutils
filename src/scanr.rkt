#!/usr/bin/racket
#lang racket/base
(require "header.rkt")

; Scan common network ports using netcat

(define (command-list target)
  (string-append (string-append "nc -vzw1 " target)
                 " 1-162 \
443 587 993 1735 8008 8080 8443 2>&1 | grep succeeded"))

(define (port-scan target)
  (lead-echo "" (command-list target)))

(run port-scan)
