function PivotGauss(Matrix, vector)
	N = length(Matrix);
	for k = 1 : N - 1
		pivot = k;
		mx = abs(Matrix(k, k));
		for m = k + 1 : N
			if abs(Matrix(m, k)) > mx
				pivot = m;
				mx = abs(Matrix(m, k));
			end
		end
		if pivot > k
			for i = k : N
				s = Matrix(k, i);
				Matrix(k, i) = Matrix(pivot, i);
				Matrix(pivot, i) = s;
			end
			t = vector(k);
			vector(k) = vector(pivot);
			vector(pivot) = t;
		end
		% 前進消去
		for i = k + 1 : N
			alpha = Matrix(i, k) / Matrix(k, k);
			for j = k : N
				Matrix(i, j) = Matrix(i, j) - alpha * Matrix(k, j);
			end
			vector(i) = vector(i) - alpha * vector(k);
		end
	end
	% 後退代入
	x = zeros(size(vector));
	for k = N : -1 : 1
		x(k) = vector(k);
		for j = k + 1 : N
			x(k) = x(k) - Matrix(k, j) * x(j);
		end
		x(k) = x(k) / Matrix(k, k);
	end
	% ex03
	fprintf("x=\n");
	for v = 1 : N
		fprintf("%.4e\n", x(v));
	end
end

n = 7;
A = zeros(n);
b = zeros(n, 1);
for i = 1 : n
	for j = 1 : n
		if abs(i - j) <= 1
			A(i, j) = 3;
		else
			A(i, j) = 1;
		end
	end
	b(i, 1) = 1;
end

PivotGauss(A, b);
