syms x y
%{
% f(x, y) = y^5 - 3xy
f(x, y) = y^5 - 3*x*y;
fx = diff(f, x)
fy = diff(f, y)
fxx = diff(fx, x)
fyy = diff(fy, y)
fxy = diff(fx, y)

f(x, y) = int(cos(t^2), t, x, y);
fx = diff(f, x)
fy = diff(f, y)
fxx = diff(fx, x)
fyy = diff(fy, y)
fxy = diff(fx, y)
%}
f(x, y) = log(x + sqrt(x^2 + y^2))
fx = diff(f, x)
fy = diff(f, y)
fxx = diff(fx, x)
fyy = diff(fy, y)
fxy = diff(fx, y)