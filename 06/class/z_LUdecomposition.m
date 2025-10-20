function [A, x] = z_LUdecomposition(C, b)
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

    % 前進代入 (Ly = b)
    y = zeros(size(b));
    for k = 1:n
        y(k) = b(k);
        for j = 1:k-1
            y(k) = y(k) - A(k, j) * y(j);
        end
    end

    % 後退代入 (Ux = y)
    x = zeros(size(b));
    for i = n:-1:1
        tmp = 0;
        for j = i+1:n
            tmp = tmp + A(i, j) * x(j);
        end
        x(i) = (y(i) - tmp) / A(i, i);
    end
end
