function ex023(steps)
    N = 51;
    grid = zeros(N);
    x = ceil(N / 2);
    y = ceil(N / 2);
    dir = 1; % 1=up, 2=right, 3=down, 4=left

    % 初期値
    cx = ceil(N / 2);
    cy = ceil(N / 2);
	for i = cx - 10 : cx + 10
		if i < cx
			grid(cy, i) = 1;
		elseif i > cx
			grid(cy, i) = 2;
		end
	end

    % ---- 計算だけ行う ----
    for n = 1:steps
        c = grid(y, x);

        % 状態遷移
        if c == 0
            dir = mod(dir, 4) + 1;
            grid(y, x) = 1;
        elseif c == 1
            dir = mod(dir - 2, 4) + 1;
            grid(y, x) = 2;
        else % c == 2
            dir = mod(dir, 4) + 1;
            grid(y, x) = 0;
        end

        % 移動
        if dir == 1
            y = y - 1;
        elseif dir == 2
            x = x + 1;
        elseif dir == 3
            y = y + 1;
        else
            x = x - 1;
        end

        % 枠外判定
        if x < 1 || x > N || y < 1 || y > N
            fprintf('Stopped at boundary (Step %d)\n', n);
            break;
        end
    end

    % ---- 新しいウィンドウで最終状態を描画 ----
    figure;
    imagesc(grid);
    set(gca, 'YDir', 'normal');
    colormap([1 1 1; 0 0 0; 0 0 1]);
    axis square off;
    hold on;
    plot(x, y, 'ro', 'MarkerFaceColor', 'r');
    title(sprintf('Final State (Step %d)', min(n, steps)));
end
