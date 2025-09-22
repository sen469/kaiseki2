function z_Heun(N, a, b)
	f = @(x, y) x + y;
	h = (b - a) / N;
	x = a : h : b;
	y1 = zeros(size(x));
	y2 = zeros(size(x));
	y1(1) = 1;
	y2(1) = y1(1);

	for i = 1:length(x)-1
		y1(i+1) = y1(i) + (h/2) * (f(x(i), y1(i)) + f(x(i + 1), y1(i) + h * f(x(i), y1(i)))); % Heun-method
		y2(i + 1) = y2(i) + h * f(x(i), y2(i)); % Euler-method
	end

	figure(1)
	plot(x, y1, '-o', 'DisplayName', 'Heun-method');
	hold on
	plot(x, y2, '-p', 'DisplayName', 'Euler-method');
	plot(x, 2 * exp(x) - x - 1, 'DisplayName', 'ExplicitSol');
	hold off;
	xlabel('x-axis')
	ylabel('y-axis')
	legend
	format longE
	y1(N + 1)
