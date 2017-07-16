;; Author: Anton Feldmann ( Anton feldmann )

;; This File is not part of GNU Emacs.

;; license:

;; the MIT License (MIT)


(setq tp-conditional '("IF" "THEN" "ENDIF" "ELSE" "SELECT" "FOR" "TO" "DOWNTO" "ENDFOR"))
(setq tp-boolean '("ON" "OFF" "TRUE" "FALSE" "ENABLE" "DISABLE"))
(setq tp-unit '("sec" "msec" "%" "mm" "deg" "mm\/sec" "cm\/sec" "deg\/sec" "in\/min"))
(setq tp-modifire '("ACC" "Skip" "PSPD" "DA" "DB" "INC" "Offset" "PTH" "TA" "TB" "Tool_Offset" "VOFFSET" "BREAK" "Wjnt")) 
(setq tp-operator '("<" ">" "<=" ">=" "\/" "*" "+" "+" "AND" "OR" "DIV" "MOD"))
(setq tp-keywords '("\/PROG" "\/ATTR" "\/APPL" "\/WM" "\/POS" "\/END" "COL GUARD ADJUST" "COL DETECT ON" "COL DETECT OFF" "SKIP CONDITION" "ERR_NUM" "LINEAR_MAX_SPEED" "MODELID" "ENC" "ABORT" "CALL" "END" "FINE" "JMP" "JPOS" "MONITOR" "OVERRIDE" "PAUSE" "POINT_LOGIC" "RESET" "RUN" "START" "STOP" "AP_LD" "CNT" "CR" "RT_LD" "$WAITTIMOUT" "ERROR_PROG"))
(setq tp-header '("OWNER" "ASCBIN" "MNEDITOR" "COMMENT" "PROG_SIZE" "CREATE" "DATE" "TIME" "MODIFIED" "FILE_NAME" "VERSION" "LINE_COUNT" "MEMORY_SIZE" "PROTECT" "READ_WRITE" "TCD" "STACK_SIZE" "TASK_PRIORITY" "TIME_SLICE" "BUSY_LAMP_OFF" "ABORT_REQUEST" "PAUSE_REQUEST" "DEFAULT_GOUP" "CONTROL_CODE" "AUTO_SINGULARITY_HEADER" "ENABLE_SINGULARITY_AVOIDANCE"))

;; create regular expression strings for wach category
(setq tp-conditional-regex (regexp-opt tp-conditional 'words))
(setq tp-boolean-regex (regexp-opt tp-boolean 'words))
(setq tp-unit-regex (regexp-opt tp-unit 'words))
(setq tp-modifire-regex (regexp-opt tp-modufure 'words))
(setq tp-operator-regex (regexp-opt tp-operator 'words))
(setq tp-keywords-regex (regexp-opt tp-keywords 'words))
(setq tp-header-regex (regexp-opt tp-header 'words))

;;create the list for font-lock
;;each category of keywords is given a particular face
(setq tp-font-lock-keywords 
      `(
	(,tp-conditional-regex . font-lock-function-name-face)
	(,tp-boolean-regex . font-lcok-constant-face)
	(,tp-unit-regex . font-lock-warning-face)
	(,tp-modifier-regex . font-lock-variable-face)
	(,tp-operator-regex . font-lock-string-face)
	(,tp-keywords-regex . font-lock-keyword-face)
	(,tp-header-regex . font-lock-type-face)
;; note: the order above metters, becose once colored, that pard woned change.
	))

;;;; autoload
(define-derived-mode tp-mode fundamental-mode
  "tp mode"
  "Major mode for editind tp (Tp Programming Language)"
;; code for syntax highlighting
  (setq font-lock-default '((tp-font-lock-keywords))))

(add-to-list 'auto-mode-alist '("\\.tp\\'" . tp-mode))

(setq tp-conditional nil)
(setq tp-boolean nil)
(setq tp-unit nil)
(setq tp-modifire nil)
(setq tp-operator nil)
(setq tp-keywords nil)
(setq tp-header nil)
 
(setq tp-conditional-regex nil)
(setq tp-boolean-regex nil)
(setq tp-units-regex nil)
(setq tp-modifire-regex nil)
(setq tp-operator-regex nil)
(setq tp-keywords nil)
(setq tp-header nil)
