function ex01(steps)
    N = 101;
    grid = zeros(N);
    x = ceil(N / 2);
    y = ceil(N / 2);
    dir = 1; % 1=up, 2=right, 3=down, 4=left

    for n = 1:steps
        c = grid(y, x);
        if c == 0
            dir = dir + 1; if dir > 4, dir = 1; end
            grid(y, x) = 1;
        else
            dir = dir - 1; if dir < 1, dir = 4; end
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
            fprintf("Stopped at boundary (Step %d)\n", n);
            break;
        end
    end

    % 黒マス数カウント
    cnt = nnz(grid(:) == 1);
    fprintf("steps = %d, 黒マスの個数は %d\n", min(n, steps), cnt);
end
