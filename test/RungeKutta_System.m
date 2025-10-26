% ルンゲクッタシステム（非正式名称）
% 連立1次微分方程式
% n分割数、a,bは端点
function RungeKutta_System(n, a, b)
 	% 本番ではここを書き換えるだけ TODO
	f = @(x, y)[y(2); -y(1) + x / 4];
	% hは刻み幅
	h = (b - a) / n;
	% xを幅hで分割する
	% 分割数はn
	x = a : h : b;
	% 値を記録する場所
	% サイズは(2, n + 1)行列
	y = zeros(2, length(x));
	% 初期値を書き換える TODO
	% [y1(1); y2(1)]
	y(:, 1) = [0; 1];

	for i = 1 : length(x) - 1
		k1 = h * f(x(i), y(:, i));
		k2 = h * f(x(i) + h / 2, y(:, i) + k1 / 2);
		k3 = h * f(x(i) + h / 2, y(:, i) + k2 / 2);
		k4 = h * f(x(i) + h, y(:, i) + k3);
		y(:, i + 1) = y(:, i) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
	end

	% 出力桁指定に注意 TODO
	fprintf("%.15e, %.15e\n", y(1, n + 1), y(2, n + 1));
end
% ============= memo =====================
% 補足
% y(:, i) これは二次元配列yのi列目
