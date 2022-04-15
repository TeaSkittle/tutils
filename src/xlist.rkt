#lang racket/base
(require shell/pipeline)
(require "header.rkt")

(system-display
 (run-subprocess-pipeline '(ls -al)
                          '(grep -Ei "^[rwx-]{9}x")
                          '(awk "{print $9}")
                          '(tail -n +2)))
