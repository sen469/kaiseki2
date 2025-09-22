function ex02(N, a, b)
	f = @(x, y) (y - 2 * x * x) / (x + 1);
	h = (b - a) / N;
	x = a : h : b;
	y1 = zeros(size(x));
	y2 = zeros(size(x));
	y1(1) = 1;
	y2(1) = y1(1);

	for i = 1:length(x)-1
		y1(i+1) = y1(i) + (h / 2) * (f(x(i), y1(i)) + f(x(i + 1), y1(i) + h * f(x(i), y1(i)))); % Heun-method
		y2(i + 1) = y2(i) + h * f(x(i), y2(i)); % Euler-method
	end

	figure(1)
	plot(x, y1, '-o', 'DisplayName', 'Heun-method');
	hold on
	plot(x, y2, '-p', 'DisplayName', 'Euler-method');
	hold off;
	xlabel('x-axis')
	ylabel('y-axis')
	legend
    fprintf("Heun-method = %.15e\n", y1(N + 1));
    fprintf("Euler-method = %.15e\n", y2(N + 1));
