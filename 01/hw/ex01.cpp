#include "LinearAlgebra.hpp"
#include <iostream>
#include <vector>
#include <math.h>
using namespace std;

int main()
{
	vector<double> x(120);
	for (int i = 0; i < 120; i++)
	{
		x[i] = i + 1;
		x[i] = sqrt(x[i]);
	}
	double norm1 = VectorNorm1(x);
	double norm2 = VectorNorm2(x);
	double norm_inf = VectorNormInfinity(x);
	printf("norm1 = %.4e\nnorm2 = %.4e\nnorm_inf = %.4e\n", norm1, norm2, norm_inf);
	return (0);
}
