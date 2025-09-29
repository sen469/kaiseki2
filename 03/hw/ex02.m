% ex02_sub.mを実行すること
function ex02(N, a, b)
	f = @(x, y) y - x * x * x * x * x * x + 1;
	h = (b - a) / N;
	x = a : h : b;
	y1 = zeros(size(x));
	y2 = zeros(size(x));
	y1(1) = 1;
	y2(1) = 1;

	for i = 1 : length(x) - 1
		k1 = h * f(x(i), y1(i));
		k2 = h * f(x(i) + h / 2, y1(i) +  k1 / 2);
		k3 = h * f(x(i) + h / 2, y1(i) +  k2 / 2);
		k4 = h * f(x(i) + h, y1(i) +  k3);
		y1(i + 1) = y1(i) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
	end

	for i = 1 : length(x) - 1
		y2(i + 1) = y2(i) + h * f(x(i), y2(i));
	end
	fprintf("N = %d, Euler = %.4e, RungeKutta= %.4e\n", N, y2(N + 1), y1(N + 1));
end

