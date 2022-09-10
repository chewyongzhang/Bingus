/*
 * bubble_sort.s
 *
 *  Created on: 4/8/2022
 *      Author: Ni Qingqing
 */
   .syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.thumb

		.global bubble_sort

@ Start of executable code
.section .text

@ EE2028 Assignment 1, Sem 1, AY 2022/23
@ (c) ECE NUS, 2022
@ Bubble sort arr in decending order

@ Write Student 1’s Name here:
@ Write Student 2’s Name here:

@ You could create a look-up table of registers here:

@ R0 ...
@ R1 ...

@ write your program from here:

bubble_sort:
	PUSH {R1-R11, R14}
	MOV R8, #0 @total count
	MOV R4, #0 @count
	MOV R3, R0 @loading R3 with the first element in the array (to be kept)
	MOV R5, R0 @loading R5 with the first element in the array (to be used)
	MOV R6, R1 @loading R6 with the length of array (to be kept)
	MOV R7, R6 @loading R7 with length of array (to be used)

	BL SUBROUTINE

	MOV R7,R6 @reset length
	MOV R5, R3 @reset address
	MOV R0, R3 @reset address
	ADD R8, R4 @add count to total count

	CMP R4, 0 @if count of swap != 0
	ITT NE
	MOVNE R4, #0 @reset count to zero
	BNE SUBROUTINE @back to subroutine

	MOV R0, R8
	POP {R1-R11,R14} @POP everything back from first line
	BX LR @return to main.c

SUBROUTINE:

	LDR R1, [R5], #4 @Load arr[0] into R1
	LDR R2, [R5] @Load arr[1] into R2

	CMP R1, R2 @compare arr[0] and arr[1]
		ITTT LT @if R1 less than R2,
		STRLT R2, [R0],#4 @store arr[1] into arr[0]
		STRLT R1, [R0] @store arr[0] into arr[1]
		ADDLT R4, #1 @counter++
	CMP R1, R2 @compare arr[0] and arr[1]
		ITT GT @if arr[0] greater than arr[1]
		STRGT R1, [R0],#4 @store r1 in the address of r0 and then update r0 to r0 + 4
		STRGT R2, [R0] @store r2 in the updated address

	SUB R7, 1 @minus 1 off the length of array

	CMP R7,1 @compare length with 1
	IT GT @if length is greater than 1, repeat subroutine
	BGT SUBROUTINE

	BX LR







