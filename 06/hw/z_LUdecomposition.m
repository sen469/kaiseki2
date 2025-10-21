function [L, U, invA] = z_LUdecomposition(C)
    A = C;
    n = length(A);

    % LU分解
    for k = 1:n
        for i = k+1:n
            alpha = A(i, k) / A(k, k);
            A(i, k) = alpha;
            for j = k+1:n
                A(i, j) = A(i, j) - alpha * A(k, j);
            end
        end
    end

    % L, U の抽出
    L = eye(n);
    for i = 2:n
        for j = 1:i-1
            L(i, j) = A(i, j);
        end
    end
    U = triu(A);

    % 逆行列の計算
    I = eye(n);
    invA = zeros(n);
    for k = 1:n
        % Ly = e_k （前進代入）
        y = zeros(n, 1);
        for i = 1:n
            y(i) = I(i, k) - L(i, 1:i-1) * y(1:i-1);
        end

        % Ux = y （後退代入）
        x = zeros(n, 1);
        for i = n:-1:1
            x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
        end

        invA(:, k) = x;
    end

    % 結果出力
    disp('L =');
    % disp(L);
    for i = 1 : n
        for j = 1 : n
            fprintf("%.4e\t", L(i, j));
        end
        fprintf("\n");
    end
    disp('U =');
    for i = 1 : n
        for j = 1 : n
            fprintf("%.4e\t", U(i, j));
        end
        fprintf("\n");
    end
    % disp(U);
    disp('inv(A) =');
    for i = 1 : n
        for j = 1 : n
             fprintf("%.4e\t", invA(i, j));
       end
        fprintf("\n");
    end
    % disp(invA);
end
