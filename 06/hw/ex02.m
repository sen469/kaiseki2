n = 7;
M = zeros(n);
for i = 1 : n
	for j = 1 : n
		M(i, j) = 1 / (i + j - 1);
	end
end

fprintf("n = %d\n1-norm = %.4e\ninf-norm = %.4e\n", n, norm(M, 1), norm(M, inf));

% (2)
n = 4;
M = zeros(n);
for i = 1 : n
	for j = 1 : n
		M(i, j) = 1 / (i + j - 1);
	end
end

 z_LUdecomposition(M);
