p = [-2, -1, 0, 1, 2];
ans = [1, 1, 1, 1, 1];

for i = 1: 3
	ans = ans .* p;
end

disp(ans);
