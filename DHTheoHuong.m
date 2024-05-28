syms x y z

% 3/34
f(x, y) = x^2 * y^3 - y^4;
fx = diff(f, x);
fy = diff(f, y);
d = [fx fy];
v = [cos(pi/4) sin(pi/4)];
dir = d .* v / norm(v);
sum(subs(dir, [x, y], [0, 2]))

% 6/35
f(x, y) = sin(2*x + 3*y);
fx = diff(f, x);
fy = diff(f, y);
d = [fx fy];
v = [sqrt(3)/2 -1/2];
dir = d .* v / norm(v);
sum(subs(dir, [x, y], [-6, 4]))

% 9/35
f(x, y, z) = sqrt(x + y*z);
fx = diff(f, x);
fy = diff(f, y);
fz = diff(f, z);
d = [fx fy fz];
v = [2/7 3/7 6/7];
dir = d .* v / norm(v);
sum(subs(dir, [x, y, z], [1, 3, 1]))

