function [A, Q] = Jacobi(B)
	% B: 対象行列
	% A: 対象化行列
	n = length(B);
	% 最大反復回数
	s = 100;
	% 許容誤差
	epsilon = 1e-5;
	A = B;
	Q = eye(n);
	for l = 1 : s
		% 行列の絶対値最大値とその位置を探す
		mx = 0;
		for i = 1 : n
			for j = 1 : n
				if i ~= j && abs(A(i, j)) > abs(mx)
					mx = A(i, j);
					% 絶対値の最大のi成分
					k = i;
					% 絶対値の最大のj成分
					m = j;
				end
			end
		end

		% 収束判定
		if (abs(mx) < epsilon)
			break;
		elseif l == s
			disp('収束しない')
		end

		if A(k, k) == A(m, m)
			theta = pi / 4;
		else
			theta = atan(2 * A(k, m) / (A(k, k) - A(m, m))) / 2;
		end

		% P行列のk列目とm列目のベクトルを操作する
		% Givens回転行列の定義
		P = eye(n);
		P(k, k) = cos(theta);
		P(k, m) = -sin(theta);
		P(m, k) = sin(theta);
		P(m, m) = cos(theta);
		%A, Qを更新する
		A = transpose(P) * A * P;
		Q = Q * P;
	end
end
% ==================== memo ====================
% eye(n) でn次の他に行列を出力する
% actan()でtanの逆関数を表す

% このコードのやっていることとしては、対角成分以外の要素を0にしたい
% その際にGivens面内回転行列を掛けることで、一番でかい要素を一つずつ0にしていく
