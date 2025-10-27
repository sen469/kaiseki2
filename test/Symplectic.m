function Symplectic(n, a, b)
	h = (b - a) / n;
	t = a : h : b;
	y1 = zeros(size(t));
	y2 = zeros(size(t));
	% 初期値 TODO
	y1(1) = 0;
	y2(1) = 1;
	for i = 1: length(t) - 1
		% 微分方程式 TODO
		y1(i + 1) = y1(i) + h * y2(i);
		y2(i + 1) = y2(i) - h * y1(i + 1);
	end

	% 出力桁数 TODO
	fprintf("y1(N + 1) = %.15e, y2(N + 1) = %.15e\n", y1(n + 1), y2(n + 1));
end

