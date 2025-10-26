% ルンゲクッタ
% 1次微分方程式1つだけ
% n分割数、a,bは端点
function RungeKutta(n, a, b)
 	% 本番ではここを書き換えるだけ TODO
	f = @(x, y) x + y;
	% hは刻み幅
	h = (b - a) / n;
	% xを幅hで分割する
	x = a : h : b;
	% 値を記録する場所
	% サイズはn + 1
	y = zeros(size(x));
	% 初期値を書き換える TODO
	y(1) = 1;

	for i = 1 : length(x) - 1
		k1 = h * f(x(i), y(i));
		k2 = h * f(x(i) + h / 2, y(i) + k1 / 2);
		k3 = h * f(x(i) + h / 2, y(i) + k2 / 2);
		k4 = h * f(x(i) + h, y(i) + k3);
		y(i + 1) = y(i) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
	end

	% 出力桁指定に注意 TODO
	fprintf("%.15e\n", y(n + 1));
end
% ============= memo =====================
