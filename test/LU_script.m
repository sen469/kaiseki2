% このようにして行列を初期化
% 1 2 3
% 4 5 6
% 7 8 9
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
M = zeros(size(A));
n = length(A);

% fprintf("逆行列inv()は\n");
% disp(inv(A));

for i = 1 : n
	% v...n x 1行列
	v = zeros(n, 1);
	v(i) = 1;
	[~, x] = LUdecomposition(A, v);
	M(:, i) = x;
end

% 逆行列の1行2列の要素を出力
% 桁数指定 TODO
% fprintf("%.4e\n", M(1, 2));

% LU分解を用いた逆行列全体を出力 TODO
fprintf("LUを用いた逆行列LU(A)=\n");
disp(M);
% ============= memo =====================
% 補足
% Ax = bのx, bを列ベクトルにすることで
% Aの逆ベクトルを求める
% イメージ的にはAx = Eとし、
% xを解くことで、A^-1がもとまる
