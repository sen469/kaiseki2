function z_RungeKutta(N, a, b)
	f = @(x, y) x + y;
	h = (b - a) / N;
	x = a : h : b;
	y1 = zeros(size(x));
	y1(1) = 1;

	for i = 1 : length(x) - 1
		k1 = h * f(x(i), y1(i));
		k2 = h * f(x(i) + h / 2, y1(i) +  k1 / 2);
		k3 = h * f(x(i) + h / 2, y1(i) +  k2 / 2);
		k4 = h * f(x(i) + h, y1(i) +  k3);
		y1(i + 1) = y1(i) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
	end

	figure(1)
	plot(x, y1, '-o', 'DisplayName', 'RungeKutta');
	hold on
	% plot(x, 2 * exp(x) - x - 1, 'DisplayName', 'Explicit Solution');
	hold off
	xlabel('x-axis')
	ylabel('y-axis')
	legend
	fprintf("近似解 = %.15e\n", y1(N + 1));
	% fprintf("厳密解 = %.15e\n", 2 * exp(1) - 1 - 1);
end
