function z_Symplectic(N, a, b)
	h = (b - a) / N;
	t = a : h : b;
	y1 = zeros(size(t));
	y2 = zeros(size(t));
	y1(1) = 0;
	y2(1) = 1;
	for i = 1: length(t) - 1
		y1(i + 1) = y1(i) + h * y2(i);
		y2(i + 1) = y2(i) - h * y1(i + 1);
	end

	figure(1);
	plot(y1, y2, '-s', 'DisplayName', 'y');
	xlabel('y1-axis')
	ylabel('y2-axis')
	fprintf("y1(N + 1) = %.15e, y2(N + 1) = %.15e\n", y1(N + 1), y2(N + 1));
