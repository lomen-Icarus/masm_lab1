; Лабораторная работа №1. Арифметические операции
; Вариант 8: X = (3*A + 2*B) - C/4 + 10
; A = 2, B = 4, C = 8  ->  X = 22

.586
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
valA DD 2
valB DD 4
valC DD 8
X    DD ?

.code
main:
  mov eax, valA     ; eax = A
  imul eax, 3       ; eax = 3*A

  mov ebx, valB     ; ebx = B
  imul ebx, 2       ; ebx = 2*B

  add eax, ebx      ; eax = 3*A + 2*B
  mov ecx, eax      ; сохраняем скобку в ecx

  mov eax, valC     ; eax = C
  cdq               ; расширяем eax в edx:eax для деления
  mov ebx, 4
  idiv ebx          ; eax = C/4

  sub ecx, eax      ; ecx = (3*A + 2*B) - C/4
  add ecx, 10       ; ecx = (3*A + 2*B) - C/4 + 10

  mov X, ecx        ; сохраняем результат
  INVOKE ExitProcess, X
END main
