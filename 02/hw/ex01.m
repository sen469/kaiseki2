function ex01(N, a, b)
	f = @(x, y) (y - 2 * x * x) / (x + 1);
	h = (b - a) / N;
	x = a : h : b;
	y2 = zeros(size(x));
	y2(1) = 1;

	for i = 1:length(x)-1
		y2(i + 1) = y2(i) + h * f(x(i), y2(i)); % Euler-method
	end

	figure(1)
	plot(x, y2, '-p', 'DisplayName', 'Euler-method');
	xlabel('x-axis')
	ylabel('y-axis')
	legend
	format longE
	y2(N + 1)

