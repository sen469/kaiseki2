%ネイピア
function yn = ex02(n)

a = 0;
b = 1;
h = (b - a) / n;

x = a : h : b;
y = zeros(size(x));
y(1) = 0;

for i = 1 : length(x) - 1
    y(i + 1) = y(i) + h * 4.0 / (1 + x(i) * x(i));
end

format shortE
yn = y(n + 1)

figure(1)
plot(x, y, '-o')
xlabel('x-axis')
ylabel('y-axis')
