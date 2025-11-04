A = [5, 2; 2, 1];
% て計算よりtheta = pi / 8であるから
theta = 3 * pi / 8;
P = [cos(theta), sin(theta); -sin(theta), cos(theta)];
A = transpose(P) * A * P;

for i = 1 : 2
	fprintf("固有値λ=%.4e\n", A(i, i));
end
