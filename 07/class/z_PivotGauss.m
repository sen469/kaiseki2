function z_PivotGauss(Matrix, vector)
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
		for i = k + 1 : N
			alpha = Matrix(i, k) / Matrix(k, k);
			for j = k : N
				Matrix(i, j) = Matrix(i, j) - alpha * Matrix(k, j);
			end
			vector(i) = vector(i) - alpha * vector(k);
		end
	end
	x = zeros(size(vector));
	for k = N : -1 : 1
		x(k) = vector(k);
		for j = k + 1 : N
			x(k) = x(k) - Matrix(k, j) * x(j);
		end
		x(k) = x(k) / Matrix(k, k);
	end
	disp(x);
end
