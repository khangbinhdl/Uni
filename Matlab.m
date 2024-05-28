% 1. Ve do thi ham so
x = linspace(-10, 10, 50); % Gioi han cua do thi tu -10 toi 10, 50 diem
y = linspace(-10, 10, 50);
[X, Y] = meshgrid(x, y);
Z = Y.^2 - X.^2;
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('z');

% 2. Giai pt, hpt
% Giai he phuong trinh
syms x y z
pt_1 = x + y + z == 0;
pt_2 = 2*x - y + z == 0;
pt_3 = 6*x - 10*y == 0;

N = solve([pt_1, pt_2, pt_3], [x, y, z]);
fprintf("x: %.2f\ny: %.2f\nz: %.2f\n", N.x, N.y, N.z)
% Giai phuong trinh
pt = x^2 - 6*x - 14 == 0;
X = solve(pt, x);
for i = 1 : length(X)
    fprintf("Nghiem thu %d: %.2f\n", i, X(i))
end

% 3. Dao ham rieng
% Tinh dao ham rieng cap cao
f(x, y) = x^y + 2*x*y;
% Cap 1
fx = diff(f, x)
fy = diff(f, y)
% Cap 2
fxx = diff(fx, x)
fyy = diff(fy, y)
fxy = diff(fx, y)
% The (x, y)
subs(fxx, [x, y], [1, 3])

% 4. Dao ham theo huong
% Dao ham theo huong v tai (3, 4)
syms x y
f(x, y) = 1 + 2 * x * sqrt(y);
dx = diff(f, x);
dy = diff(f, y);
d = [dx dy];
v = [4 -3];
dir = d .* v / norm(v);
subs(dir, [x, y], [3, 4])

% 5. Tinh tich phan boi
f(x, y) = 6 * x^2 * y^3 - 5 * y^4;
int(int(f, x, [0, 3]), y, [0, 1])

% 6. Ve truong vector
% F(x, y) = <-y, 2x>
[x, y] = meshgrid(-5:5:5, -5:5:5);
P = -y;
Q = 2*x;
quiver(x, y, P, Q)
axis equal; axis tight; grid on;

% 7. Pt vi phan
% Phuong trinh vi phan khong dieu kien
syms y(x)
pt = x * diff(y, x) == y;
dsolve(pt)
% Them dieu kien dau
pt = diff(y, x) == x + y
dk = y(0) == 2
dsolve(pt, dk)
