syms y(x)
% 5/84
pt = (1 + tan(y)) * diff(y, x) == x^2 + 1;
dsolve(pt)
% 22/85
pt = diff(y, x) * y == x;
dk = y(0) == -3;
dsolve(pt, dk)
% 1/86
pt = x * diff(y, x) == y + exp(y/x);
dsolve(pt)
% 15/92
pt = diff(diff(y, x), x) + 3*y == 0;
dk_1 = y(0) == 1;
dk_2 = subs(diff(y, x), 0) == 3;
dsolve(pt, dk_1, dk_2)
