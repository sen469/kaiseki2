%演習課題2回目-1
function yn = SKK21(n)
%E10.3オイラー法でのグラフの出力プログラム
a = 0;%区間の右側
b = 10;%区間の左側
h = (b - a) / n;%分割幅
x = a:h:b;%aからbまでの公差hの等差数列
y = zeros(size(x));%yの値を入れるためのリスト
y(1) = 1;%初期値

for i = 1:length(x) - 1
    y(i + 1) = y(i) + h * ((y(i) - 2 * x(i) * x(i)) / (x(i) + 1));
end

yn = y(i + 1);

figure(2)%新規のfigureウィンドウを作成する
plot(x, y, '-o')
xlabel('x-axis')
ylabel('y-axis')