.686
.model flat,stdcall
.stack 100h
.data
	array_start	dd 0.5, 1.0, 3.5
			dd 4.0, 2.0, 0.2
			dd 0.4, 0.5, 1.4

array_sin 		dd 0.0, 0.0, 0.0
		  	dd 0.0, 0.0, 0.0
		 	dd 0.0, 0.0, 0.0

array_cos 		dd 0.0, 0.0, 0.0
		  	dd 0.0, 0.0, 0.0
		  	dd 0.0, 0.0, 0.0
i dd 0; счётчик строк
j dd 0; счётчик столбцов
n dd 3; размерность массива
temp dd 0.0; временная переменная
mysize dd 4; размер ячейки

.code
ExitProcess PROTO STDCALL :DWORD
Start:
	
	finit; Проверить на наличие отложенных незамаскированных исключений и инициализировать FPU Инициализация сопроцессора

L1: 
	mov j, 0; обнуляем счётчик столбцов и регистры
	xor eax, eax;
	xor ebx, ebx;
	xor ecx, ecx;
L2:
	mov eax, n; Адрес элемента массива eax=(n*i+j)*mysize
	mul i; умножение 
	add eax, j; сложение
	mul mysize; умножение

	fld array_start[eax]; данные в радианах
	fld array_start[eax]; Команда FLD помещает операнд-источник в стек FPU

	fsin; вычисление sin
	fstp array_sin[eax]; Команда FST копирует текущее значение из регистра ST в операнд-назначение
	fcos; Вычисление cos
	fstp array_cos[eax];

	inc j; изменение индекс j
	mov ebx, j;
	mov ecx, n;
	cmp ebx, ecx; cравнение
	jne L2; если не равно,то переходим
			
	inc i; изменение индекс i
	mov ebx, i;
	mov ecx, n;
	cmp ebx, ecx;
	jne L1;

exit:
Invoke ExitProcess,1
End Start
