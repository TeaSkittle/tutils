#!/usr/bin/racket
#lang racket/base
(require "header.rkt")

; Need to test
; Will most likely rename file

(define (get-site domain url)
  (string-append (string-append "wget --recursive --no-clobber --page-requisites 
--html-extension --convert-links --restrict-file-names=windows " domain)
                 " --no-parent " url))

(run get-site)
