f_square = @(a, b) (b - a) * (b - a);
f_exp = @(a, b) exp(b - a);
f_combined = @(a, b) sqrt((b - a) * (b - a) + exp(b - a));

b = 102;
a = [100, 100.2];

% f1
exact_val = f_square(a(1), b);
approx_val = f_square(a(2), b);
abs_error = abs(exact_val - approx_val);
rel_error = abs_error / exact_val * 100;
fprintf("(b - a)^2\n\t真値 = %.2f, 近似値 = %.2f, 相対誤差 = %.1f%%\n", exact_val, approx_val, rel_error);

% f2
exact_val = f_exp(a(1), b);
approx_val = f_exp(a(2), b);
abs_error = abs(exact_val - approx_val);
rel_error = abs_error / exact_val * 100;
fprintf("exp(b - a)\n\t真値 = %.2f, 近似値 = %.2f, 相対誤差 = %.1f%%\n", exact_val, approx_val, rel_error);

% f3
exact_val = f_combined(a(1), b);
approx_val = f_combined(a(2), b);
abs_error = abs(exact_val - approx_val);
rel_error = abs_error / exact_val * 100;
fprintf("sqrt((b - a)^2 + exp(b - a))\n\t真値 = %.2f, 近似値 = %.2f, 相対誤差 = %.1f%%\n", exact_val, approx_val, rel_error);
