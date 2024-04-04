syms x y
f(x, y) = x * y * (x^2 - y^2)

D(x, y) = diff(diff(f, x), x) * diff(diff(f, y), y) - diff(diff(f, x), y)^2;
fxx(x, y) = diff(diff(f, x), x);

pt_1 = diff(f, x) == 0;
pt_2 = diff(f, y) == 0;

N = solve([pt_1, pt_2], [x, y], 'Real', true);

% disp(N.x)
% disp(N.y)

for i = 1 : length(N.x) 
    if (subs(D, [x, y], [N.x(i), N.y(i)]) > 0)
        if (subs(fxx, [x, y], [N.x(i), N.y(i)]) > 0)
            fprintf("Diem (%d, %d) la diem cuc tieu cua f", N.x(i), N.y(i))
        else
            fprintf("Diem (%d, %d) la diem cuc dai cua f", N.x(i), N.y(i))
        end
    else
        if (subs(D, [x, y], [N.x(i), N.y(i)]) < 0)
            fprintf("Diem (%d, %d) la diem yen ngua cua f", N.x(i), N.y(i))
        else
            fprintf("Khong co ket luan tai diem (%d, %d)", N.x(i), N.y(i))
        end
    end
    fprintf("\n")
end

