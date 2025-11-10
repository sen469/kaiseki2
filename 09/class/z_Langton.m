function z_Langton(steps)
    N = 101;
    grid = zeros(N);
    x = ceil(N / 2);
    y = ceil(N / 2);
    dir = 1; % 1=up, 2=right, 3=down, 4=left

    % 初期パターン（中央の正方形）
    cx = ceil(N / 2);
    cy = ceil(N / 2);
    grid(cy - 5: cy + 5, cx - 5: cx + 5) = 1;

    % 画像初期化
    h = imagesc(grid); colormap([1, 1, 1; 0, 0, 0]); axis square off; hold on;
    p = plot(x, y, 'ro', 'MarkerFaceColor', 'r');

    for n = 1:steps
        c = grid(y, x);
        if c == 0
            dir = dir + 1;
            if dir > 4
                dir = 1;
            end
            grid(y, x) = 1;
        else
            dir = dir - 1;
            if dir < 1
                dir = 4;
            end
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
            title(sprintf('Stopped at boundary (Step %d)', n));
            break;
        end

        % 描画更新
        set(h, 'CData', grid);
        set(p, 'XData', x, 'YData', y);
        title(sprintf('Step: %d / %d', n, steps));
        drawnow limitrate;
        pause(0.0001);
    end
end
