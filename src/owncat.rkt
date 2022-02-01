#!/usr/bin/racket
#lang racket
(require racket/system)
(require racket/port)
(require "header.rkt")

(define (owncat filename)
  (system (string-append "echo -n 'Owner: ';" (string-append (string-append "ls -l " filename) "| awk '{print $3}'")))
  (system (string-append "echo -n 'Group: ';" (string-append (string-append "ls -l " filename) "| awk '{print $4}'")))
  (system (string-append "echo -n 'Octal: ';" (string-append (string-append "stat -c '%a %n' " filename) "| awk '{print $1}'")))
  (system (string-append "echo -n 'r/w/x: ';" (string-append (string-append "ls -l " filename) "| awk '{print $1}' | sed 's/#\\.//'"))))

(run owncat)
