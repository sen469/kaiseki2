function ex022(steps)
    N = 101;
    grid = zeros(N);
    x = ceil(N / 2);
    y = ceil(N / 2);
    dir = 1; % 1=up, 2=right, 3=down, 4=left

    % ステップ更新（描画しない）
    for n = 1:steps
        c = grid(y, x);
        if c == 0
            dir = mod(dir, 4) + 1; % 右回転
            grid(y, x) = 1;
        else
            dir = mod(dir - 2, 4) + 1; % 左回転
            grid(y, x) = 0;
        end

        % 移動
        if dir == 1
            y = y - 1;
        elseif dir == 2
            x = x + 2;
        elseif dir == 3
            y = y + 1;
        else
            x = x - 2;
        end

        % 枠外判定
        if x < 1 || x > N || y < 1 || y > N
            fprintf('Stopped at boundary (Step %d)\n', n);
            break;
        end
    end

    % 最後の状態を一度だけ描画
    figure;
    imagesc(grid);
    colormap([1 1 1; 0 0 0]);
    axis square off;
    hold on;
    plot(x, y, 'ro', 'MarkerFaceColor', 'r');
    title(sprintf('Final State (Step %d)', min(n, steps)));
end
