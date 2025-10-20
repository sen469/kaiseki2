n = 4;
B = rand(n);
M = zeros(n);
inv(B)

for i = 1 : n
	v = zeros(n, 1);
	v(i) = 1;
	[~, x] = z_LUdecomposition(B, v);
	M(:, i) = x;
end
M

