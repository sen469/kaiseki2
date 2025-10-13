function z_Fractal(p, coeffs)
	%	polyval	- 格子の解像度
	%	coeffs	- 多項式の係数ベクトル(例:[1, 0, -1, 1.5]はx ^ 3 - x + 1.5)
	%	多項式 f(x)の次数
	n = length(coeffs) - 1;
	function y = f(x)
		y = polyval(coeffs, x);
	end
	% どう関数の係数を自動計算
	deriv_coeffs = polyder(coeffs);
	function y = df(x)
		y = polyval(deriv_coeffs, x);
	end

	x = linspace(-2, 2, p);
	y = linspace(-2, 2, p);
	[X, Y] = meshgrid(x, y);
	% 複素数Zの定義
	Z = X + 1i * Y;
	fracMat = zeros(size(Z));

	% 反復回数
	N = 40;
	error = 1e-10;

	% 指定された多項式を計算
	% f(x)の根を自動取得
	rootsArray = roots(coeffs);
	% 根の個数
	num_roots = length(rootsArray);

	% Newton法の反復計算
	for k = 1 : N
		Z = Z - f(Z) ./ df(Z);
		for j = 1 : num_roots
			Mj = abs(Z - rootsArray(j));
			mask = (Mj < error) & (fracMat == 0);
			fracMat(mask) = j;
		end
	end

	% draw fractal
	imagesc(fracMat);
	% setting color map
	colormap("parula");
	axis("square", 'equal', 'off');
	title(sprintf('Newton Fractal for Polynomial of Degree %i', n));
end
