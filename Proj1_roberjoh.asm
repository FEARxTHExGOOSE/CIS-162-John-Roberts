TITLE Proj1_roberjoh     (Proj1_roberjoh.asm)

; Author: John Oliver Roberts
; Last Modified: 4/21/2025
; OSU email address: roberjoh@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number:   1              Due Date: 4/21/2025
; Description: Program will prompt the user to enter two integer values, X and Y, with X being greater than Y,
;and display the sum,difference, and product of the two integers. It will then display a farewell  message and close out.

INCLUDE Irvine32.inc



.data

	; Prompts, Intros, and Farewell
	name_disp		byte	"John Oliver Roberts",0
	project_disp	byte	"Project 1",0
	project_info	byte	"Hello, please enter two integers, displayed as X and Y, to find their sum, difference, and product. Please ensure that X is greater than Y.",0
	X_prompt		byte	"Please enter your integer for X:",0
	Y_prompt		byte	"Please enter your integer for Y:",0
	farewell		byte	"Thank you for using my program! Come again!",0

	; Variables
	integerX		dword	?
	integerY		dword	?
	sum_result		dword	?
	diff_result		dword	?
	product_result	dword	?

	; Strings for results
	add_symb		byte	"+",0
	sub_symb		byte	"-",0
	product_symb	byte	"*",0
	equal_symb		byte	"=",0

	; Headers
	sum_result_header		byte "Sum Results:",0
	diff_result_header		byte "Difference Results:",0
	product_result_header	byte "Product Results:",0

.code
	; INTRODUCTION

	; Displays the programmer name
	main	PROC
	mov		EDX, OFFSET	name_disp
	call	WriteString
	call	CrLf

	; Displays the project name
	mov		EDX, OFFSET project_disp
	call	WriteString
	call	CrLf
	call	CrLf

	; Displays the project instructions
	mov		EDX, OFFSET project_info
	call	WriteString
	call	CrLf
	call	CrLf



	; USER INPUT

	; Obtains users input for X
	mov		EDX, OFFSET	X_prompt
	call	WriteString

	call	ReadDec										; Moves user's input into integerX
	mov		EBX, EAX
	mov		integerX, EBX

	; Obtains users input for Y
	mov		EDX, OFFSET Y_prompt
	call	WriteString

	call	ReadDec										; Moves user's input into integerY
	mov		ECX,EAX
	mov		integerY, ECX
	call	CrLf



	; CALCULATIONS

	; Finds the sum of integers X and Y
	add		EBX, ECX
	mov		EAX, EBX
	mov		sum_result,	EAX								; Moves sum of X and Y into sum_result

	; Finds the difference of integers X and Y
	mov		EBX, integerX
	mov		ECX, integerY
	sub		EBX, ECX
	mov		EAX, EBX
	mov		diff_result, EAX							; Moves difference of X and Y into diff_result

	; Finds the product of the integers X and Y
	mov		EAX, integerX
	mov		ECX, integerY
	mul		ECX
	mov		product_result, EAX							; Moves product of X and Y into product_result

	

	; OUTPUT RESULTS

	; Reports the sum
	mov		EDX, OFFSET sum_result_header
	call	WriteString
	call	CrLf

	mov		EAX, integerX
	call	WriteDec
	mov		EDX, OFFSET add_symb
	call	WriteString
	mov		EAX, integerY
	call	WriteDec
	mov		EDX, OFFSET equal_symb
	call	WriteString
	mov		EAX, sum_result								; Moves sum_result into EAX to be called by WriteDec
	call	WriteDec
	call	CrLf
	call	CrLf


	; Reports the difference
	mov		EDX, OFFSET diff_result_header
	call	WriteString
	call	CrLf

	mov		EAX, integerX
	call	WriteDec
	mov		EDX, OFFSET sub_symb
	call	WriteString
	mov		EAX, integerY
	call	WriteDec
	mov		EDX, OFFSET	equal_symb
	call	WriteString
	mov		EAX, diff_result							; Moves diff_result into EAX to be called by WriteDec			
	call	WriteDec
	call	CrLf
	call	CrLf


	; Reports the product of integers X and Y
	mov		EDX, OFFSET product_result_header
	call	WriteString
	call	CrLf

	mov		EAX, integerX
	call	WriteDec
	mov		EDX, OFFSET product_symb
	call	WriteString
	mov		EAX, integerY
	call	WriteDec
	mov		EDX, OFFSET equal_symb
	call	WriteString
	mov		EAX, product_result							; Moves product_result into EAX to be called by WriteDec
	call	WriteDec
	call	CrLf

	; GOODBYE

	; Farewell											; Displays the farewell message to the user
	mov		EDX, OFFSET farewell
	call	WriteString


	Invoke ExitProcess,0								; exit to operating system
main ENDP


END main
