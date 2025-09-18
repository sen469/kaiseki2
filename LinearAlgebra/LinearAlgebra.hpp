#ifndef LinearAlgebra_hpp
# define LinearAlgebra_hpp

#include <cmath>
#include <cstdio>
#include <iostream>
#include <vector>

using namespace std;

// ベクトルを出力
void			PrintVector(vector<double> vec);
// 行列を出力
void			PrintMatrix(vector<vector<double>> vec);
// ベクトルの差を出力
vector<double>	VectorSubstract(vector<double> vec1, vector<double> vec2);
// 行列 * ベクトル を出力
vector<double>	MatrixVector(vector<vector<double>> A, vector<double> x);
// Ax - b
vector<double>	ResidualError(vector<vector<double>> A, vector<double> x, vector<double> b);
// ベクトルの1ノルム
double			VectorNorm1(vector<double> vec);
// ベクトルの2ノルム
double			VectorNorm2(vector<double> vec);
// ベクトルの無限ノルム
double			VectorNormInfinity(vector<double> vec);
// 行列の1ノルム
double			MatrixNorm1(vector<vector<double>> vec);
// 行列の無限ノルム
double			MatrixNormInfinity(vector<vector<double>> vec);
// 後退代入
vector<double>	BackwardSubstitution(vector<vector<double>> A, vector<double> b);
// ガウス消去法
vector<double>	GaussianElimination(vector<vector<double>> Matrix, vector<double> Vec);
// LU分解
vector<double>	LUDecomposition(vector<vector<double>> Matrix, vector<double> Vec);
// Jacobi法
vector<double>	JacobiMethod(vector<vector<double>> Matrix, vector<double> Vec);
// GaussSeidel法
vector<double>	GaussSeidelMethod(vector<vector<double>> Matrix, vector<double> Vec);
// 冪乗法
double			PowerMethod(vector<vector<double>> a, vector<double> b);
// レイリー商
double			RayleighQuotient(vector<vector<double>> a, vector<double> b);

// 追加
// 行列の積
vector<vector<double>>	MatrixMultiplication(vector<vector<double>> a, vector<vector<double>> b);

#endif
