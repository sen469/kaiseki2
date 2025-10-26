% 1次微分方程式1つだけ
% n分割数、a,bは端点
function Heun(n, a, b)
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
		tmp = f(x(i), y(i));
		y(i + 1) = y(i) + h * (tmp + f(x(i + 1), y(i) + h * tmp)) / 2;
	end

	% 出力桁指定に注意 TODO
	fprintf("%.15e\n", y(n + 1));
end
% ============= memo =====================
