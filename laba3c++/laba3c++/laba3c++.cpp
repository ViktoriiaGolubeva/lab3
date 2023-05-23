#include <iostream>
#include <cmath>
using namespace std;

float array_start[] = { 0.5, 1.0, 3.5, 4.0, 2.0, 0.2, 0.4, 0.5, 1.4 };
float array_sin[9] = { 0 };
float array_cos[9] = { 0 };
int i = 0;
int j = 0;
int n = 3;
float mysize = 4;
float temp = 0;

int main()
{
	// Вычисление sin и cos для каждого элемента массива
	for (i = 0; i < n; i++)
	{
		for (j = 0; j < n; j++)
		{
			int index = n * i + j;
			temp = array_start[index];
			array_sin[index] = sin(temp);
			array_cos[index] = cos(temp);
		}
	}

	// Вывод массива array_start
	cout << "array_start: ";
	for (i = 0; i < n * n; i++)
	{
		cout << array_start[i] << " ";
	}
	cout << endl;

	// Вывод массива array_cos
	cout << "array_cos: ";
	for (i = 0; i < n * n; i++)
	{
		cout << array_cos[i] << " ";
	}
	cout << endl;

	// Вывод массива array_sin
	cout << "array_sin: ";
	for (i = 0; i < n * n; i++)
	{
		cout << array_sin[i] << " ";
	}
	cout << endl;

	return 0;
}



