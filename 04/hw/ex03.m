function ex03(N, a, b)
	h = (b - a) / N;
	x = a : h : b;
	y1 = zeros(size(x));
	y2 = zeros(size(x));
	y1(1) = 1;
	y2(1) = 0;
	H = zeros(size(x));
	for i = 1: length(x) - 1
		y1(i + 1) = y1(i) + h * y2(i);
		y2(i + 1) = y2(i) + h * 3 * cos(y1(i + 1));
	end

	for i = 1 : length(x)
		H(i) = y2(i) * y2(i) / 2 - 3 * sin(y1(i));
	end

	fprintf("y1(10) =\n\t%.15e\n", y1(N + 1));
	figure(1);
	plot(x, H, '-s', 'DisplayName', 'y');
	xlabel('x');
	ylabel('H(x)');
end
