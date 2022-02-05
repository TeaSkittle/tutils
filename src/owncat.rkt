#!/usr/bin/racket
#lang racket
(require racket/system)
(require racket/port)
(require "header.rkt")

(define (get-owner filename)
  (string-append (string-append "ls -l " filename) "| awk '{print $3}'"))

(define (get-group filename)
  (string-append (string-append "ls -l " filename) "| awk '{print $4}'"))

(define (get-octal filename)
  (string-append (string-append "stat -c '%a %n' " filename) "| awk '{print $1}'"))

(define (get-rwx filename)
  (string-append (string-append "ls -l " filename) "| awk '{print $1}' | sed 's/#\\.//'"))

(define (owncat filename)
  (lead-echo "Owner: "  (get-owner filename))
  (lead-echo "Group: "  (get-group filename))
  (lead-echo "Octal: "  (get-octal filename))
  (lead-echo "r/w/x/: " (get-rwx filename)))

(run owncat)

