function ex01(N, a, b)
	h = (b - a) / N;
	t = a : h : b;
	y1 = zeros(size(t));
	y2 = zeros(size(t));
	y1(1) = 1;
	y2(1) = 0;
	for i = 1: length(t) - 1
		y1(i + 1) = y1(i) + h * y2(i);
		y2(i + 1) = y2(i) + h * 3 * cos(y1(i));
	end

	fprintf("y1(10) = \n\t%.15e\n", y1(N + 1));
end
