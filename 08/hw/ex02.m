B = [6, 3, -2;
	3, 2, -1;
	-2, -1, 5];
[A, Q] = Jacobi(B);
% 対角成分が固有値
% fprintf("A=\n");
% disp(A);
for i = 1 : 3
	fprintf("固有値λ = %.4e\n", A(i, i));
end
% 列ベクトルが固有ベクトル
% disp(Q);
for i = 1 : 3
	fprintf("固有ベクトルQ=\n");
	fprintf("\t%.4e\n", Q(:, i));
end
