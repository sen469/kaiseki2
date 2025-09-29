function ex01(N, a, b)
	f = @(x, y) [y(2) * sin(y(1)) + 2 * x * x; -y(1) * cos(y(2)) + exp(2 * x)];
	h = (b - a) / N;
	x = a : h : b;
	y = zeros(2, N + 1);
	y(:, 1) = [2; 3];

	for i = 1 : N
		k1 = h * f(x(i), y(:, i));
		k2 = h * f(x(i) + h / 2, y(:, i) +  k1 / 2);
		k3 = h * f(x(i) + h / 2, y(:, i) +  k2 / 2);
		k4 = h * f(x(i) + h, y(:, i) +  k3);
		y(:, i + 1) = y(:, i) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
	end

	figure
	plot(x, y(1, :), '-o', 'DisplayName', 'y_1(t)');
	hold on
	plot(x, y(2, :), '-o', 'DisplayName', 'y_2(t)');
	xlabel('x-axis')
	ylabel('y-axis')
	legend
	grid on
	fprintf("y_1 = %.15e\n", y(1, N + 1));
	fprintf("y_2 = %.15e\n", y(2, N + 1));
end

