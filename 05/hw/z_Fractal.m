function z_Fractal(p, coeffs)
	n = length(coeffs) - 1;
	function y = f(x)
		y = polyval(coeffs, x);
	end
	deriv_coeffs = polyder(coeffs);
	function y = df(x)
		y = polyval(deriv_coeffs, x);
	end

	x = linspace(-2, 2, p);
	y = linspace(-2, 2, p);
	[X, Y] = meshgrid(x, y);
	Z = X + 1i * Y;
	fracMat = zeros(size(Z));

	N = 40;
	error = 1e-10;

	rootsArray = roots(coeffs);
	num_roots = length(rootsArray);

	for k = 1 : N
		Z = Z - f(Z) ./ df(Z);
		for j = 1 : num_roots
			Mj = abs(Z - rootsArray(j));
			mask = (Mj < error) & (fracMat == 0);
			fracMat(mask) = j;
		end
	end

	% figure;
	imagesc(fracMat);
	colormap("parula");
	axis("square", 'equal', 'off');
	title(sprintf('Newton Fractal for Polynomial of Degree %i', n));
end
