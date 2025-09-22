function z_HeunA(N, a, b)
	h = (b - a) / N;
	x = a : h : b;
	y1 = zeros(size(x));
	y1(1) = 1;

	for i = 1:length(x)-1
		f1 = y1(i);                      % f(x_i, y_i) = y_i
		f2 = y1(i) + h * f1;             % y_i + h*f(x_i, y_i)
		y1(i+1) = y1(i) + (h/2) * (f1 + f2);
	end

	figure(1)
	plot(x, y1, '-o', 'DisplayName', 'Heun-method');
	xlabel('x-axis')
	ylabel('y-axis')
	legend
	format longE
	y1(N + 1)