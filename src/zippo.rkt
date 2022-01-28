#!/usr/bin/racket
#lang racket/base
(require racket/system)
(require racket/path)
(require racket/port)
(require "header.rkt")

;(path-has-extension? "walls.zip" #".zip")

(define (uncomp filename)
  (cond
    [(path-has-extension? filename #".tar.gz")(system (string-append "tar xzf " filename))]
    [(path-has-extension? filename #".tar.bz2")(system (string-append "tar xjf " filename))]
    [(path-has-extension? filename #".tbz2")(system (string-append "tar xjf " filename))]
    [(path-has-extension? filename #".tgz")(system (string-append "tar xzf " filename))]
    [(path-has-extension? filename #".tar")(system (string-append "tar xvf " filename))]
    [(path-has-extension? filename #".zip")(system (string-append "unzip " filename))]
    [(path-has-extension? filename #".Z")(system (string-append "uncompress " filename))]
    [(path-has-extension? filename #".7z")(system (string-append "7za x " filename))]
    [(path-has-extension? filename #".xz")(system (string-append "xz -d " filename))]
    [(path-has-extension? filename #".bz2")(system (string-append "bunzip2 " filename))]
    [(path-has-extension? filename #".rar")(system (string-append "rar x " filename))]
    [(path-has-extension? filename #".gz")(system (string-append "gunzip " filename))]
    [else (displayln "Non-supported compression format.")]))

(if (= 0 (vector-length (current-command-line-arguments)))
    (exit)
    (system-display (uncomp (vector-ref (current-command-line-arguments) 0))))

