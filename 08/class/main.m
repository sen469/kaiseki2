B = [5  -1; -1 2];
[A, Q] = z_Jacobi(B);
% Aは対角行列
fprintf("A=\n");
disp(A);
% Qの列ベクトルが固有ベクトルの近似解
fprintf("Q=\n");
disp(Q);
