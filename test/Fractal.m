% pは分割数、coeffsは多項式の係数を書く
% 例 1000分割でx^3 + 2x^2 + 1 = 0を
% Fractal(1000, [1, 2, 0, 1])と書く
function Fractal(p, coeffs)
	% これは次元
	n = length(coeffs) - 1;
	% polyval...多項式coeffsにxを代入した値
	function y = f(x)
		y = polyval(coeffs, x);
	end

	% polyderは引数の多項式を微分した係数を返す
	deriv_coeffs = polyder(coeffs);
	% 多項式deriv_coeffsにxを代入した値
	function y = df(x)
		y = polyval(deriv_coeffs, x);
	end

	% -2 ~ 2の区間をp個の点で区切る TODO
	% a : h : bみたいなもの
	x = linspace(-2, 2, p);
	y = linspace(-2, 2, p);
	% meshgridは2次元（3次元）のグリッドを作成する関数
	[X, Y] = meshgrid(x, y);
	% 複素数の2次元配列（複素平面のようなものだが値は書き換え可能）
	Z = X + 1i * Y;
	% これはZのある点が収束済みかどうかを記録する配列
	% 初期値は0
	fracMat = zeros(size(Z));

	% Newton法の反復回数 TODO
	N = 40;
	% 誤差を決定 TODO
	error = 1e-10;

	% roots()は多項式の根(解)の配列を返す関数
	rootsArray = roots(coeffs);
	% disp(rootsArray)

	% 解の個数
	num_roots = length(rootsArray);

	for k = 1 : N
		% ./ これを用いることで、複素平面の全ての座標に対してNewton法の式を適用
		% ./ はZの全ての項に対して '/'の演算を適用
		Z = Z - f(Z) ./ df(Z);
		% 多項式の解に収束しているかどうかの確認
		for j = 1 : num_roots
			% Mjは二次元配列...Z全ての点とrootsArrayの距離を記録
			Mj = abs(Z - rootsArray(j));
			% 誤差が十分に小さい ∧ どの根にも収束していない ⇒ fracMat(mask)
			% maskも二次元配列...真偽値を記録
			mask = (Mj < error) & (fracMat == 0);
			% 収束した全てのrootsArray(j)に収束した点にjを代入する
			fracMat(mask) = j;
		end
	end

	figure;
	% fracMatは1~num_rootsの値が記録されていてそれぞれの値に応じて描画
	imagesc(fracMat);
	colormap("parula");
	axis("square", "equal", "off");
	title(sprintf("Newton Fractal for Polynomial of Degree %i", n));
end
% ============= memo =====================
