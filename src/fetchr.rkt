#!/usr/bin/racket
#lang racket/base
(require racket/system)
(require "header.rkt")

; TODO:
; Uptime may display weird over 10 hours, need to test
;
; Did not work on WSL, uptime is different on Ubuntu
; Broke at DE here as well

; Variables
(define get-user  (getenv "USER"))
(define get-shell (getenv "SHELL"))
(define get-de    (getenv "XDG_CURRENT_DESKTOP"))
(define get-os       "cat /etc/*-release | grep '^NAME' | cut -c 7- | tr '\"' ' '")
(define get-kernel   "cat /proc/version | cut -c 15- | cut -d '(' -f1")
(define get-cpu      "cat /proc/cpuinfo | grep 'model name' | uniq | cut -c 14-")
(define get-hostname "cat /proc/sys/kernel/hostname")
(define get-mem      "cat /proc/meminfo | grep 'MemTotal' | cut -d ':' -f2 | cut -c 8-")

; Fetch Starts Here
(displayln (string-append "User     >> " get-user))
(lead-echo                "Hostname >> " get-hostname)
(lead-echo                "Kernel   >> " get-kernel)
(lead-echo                "OS       >> " get-os)
(displayln (string-append "Shell    >> " get-shell))
(displayln (string-append "DE       >> " get-de))
(lead-echo                "CPU      >> " get-cpu)
(lead-echo                "Mem      >> " get-mem)

