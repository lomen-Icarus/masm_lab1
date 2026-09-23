.586
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
valA DD 2
valB DD 3
valC DD 2
valD DD 20
valX DD 3
Y    DD ?

.code
main:
  mov eax, valX
  cmp eax, -2
  jg  branch1
  je  branch2
  jl  branch3

branch1:
  mov eax, valC
  imul eax, valC
  imul eax, valC
  imul eax, valX
  mov ecx, eax
  mov eax, valB
  cdq
  mov ebx, 2
  idiv ebx
  sub ecx, edx
  mov Y, ecx
  jmp finish

branch2:
  mov eax, valX
  imul eax, valX
  mov ecx, valA
  imul ecx, valD
  add eax, ecx
  mov Y, eax
  jmp finish

branch3:
  mov eax, valX
  imul eax, valB
  add eax, valD
  mov Y, eax

finish:
  INVOKE ExitProcess, Y
END main
