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
i dd 0; ������� �����
j dd 0; ������� ��������
n dd 3; ����������� �������
temp dd 0.0; ��������� ����������
mysize dd 4; ������ ������

.code
ExitProcess PROTO STDCALL :DWORD
Start:
	
	finit; ��������� �� ������� ���������� ����������������� ���������� � ���������������� FPU ������������� ������������

L1: 
	mov j, 0; �������� ������� �������� � ��������
	xor eax, eax;
	xor ebx, ebx;
	xor ecx, ecx;
L2:
	mov eax, n; ����� �������� ������� eax=(n*i+j)*mysize
	mul i; ��������� 
	add eax, j; ��������
	mul mysize; ���������

	fld array_start[eax]; ������ � ��������
	fld array_start[eax]; ������� FLD �������� �������-�������� � ���� FPU

	fsin; ���������� sin
	fstp array_sin[eax]; ������� FST �������� ������� �������� �� �������� ST � �������-����������
	fcos; ���������� cos
	fstp array_cos[eax];

	inc j; ��������� ������ j
	mov ebx, j;
	mov ecx, n;
	cmp ebx, ecx; c��������
	jne L2; ���� �� �����,�� ���������
			
	inc i; ��������� ������ i
	mov ebx, i;
	mov ecx, n;
	cmp ebx, ecx;
	jne L1;

exit:
Invoke ExitProcess,1
End Start
