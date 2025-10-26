% LU分解
% Cx = bの連立方程式
function [A, x] = LUdecomposition(C, b)
	A = C;
	n = length(A);

	for k = 1 : n
		for i = k + 1 : n
			alpha = A(i, k) / A(k, k);
			A(i, k) = alpha;
			for j = k + 1 : n
				A(i, j) = A(i, j) - alpha * A(k, j); end
		end
	end

	% LU分解の
	% L行列は下三角の対角成分を全て1にした行列
	% U行列は上三角行列
	% fprintf("LU分解行列\nA=");
	% for i = 1 : n
	% 	for j = 1 : n
	% 		% 出力桁数指定 TODO
	% 		fprintf("%.4e\t", A(i, j));
	% 	end
	% 	fprintf("\n");
	% end

	% 前進代入
	y = zeros(size(b));
	y(1) = b(1);
	for k = 2 : n
		y(k) = b(k);
		for j = 1 : k - 1
			y(k) = y(k) - A(k, j) * y(j);
		end
	end


	% 後退消去
	x = zeros(size(b));
	for i = n : -1 : 1
		x(i) = y(i);
		tmp = 0;
		for j = n : -1 : i + 1
			tmp = tmp + A(i, j) * x(j);
		end
		x(i) = x(i) - tmp;
		x(i) = x(i) / A(i, i);
	end
end
% ============= memo =====================
% 補足
% 前期7回目のスライドにLU分解の詳細がある
