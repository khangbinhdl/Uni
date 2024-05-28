syms x y

% f(x, y) = |x| + |y|
x = linspace(-10, 10, 50);
y = linspace(-10, 10, 50);
[X, Y] = meshgrid(x, y);
Z = abs(X) + abs(Y)
surf(X, Y, Z)

% f(x, y) = |xy|
x = linspace(-10, 10, 50)
y = linspace(-10, 10, 50)
[X, Y] = meshgrid(x, y)
Z = abs(X .* Y)
surf(X, Y, Z)

% f(x, y) = sin(|x| + |y|)
x = linspace(-10, 10, 50)
y = linspace(-10, 10, 50)
[X, Y] = meshgrid(x, y)
Z = sin(abs(X) + abs(Y))
surf(X, Y, Z)

% f(x, y) = 1 / (1 + x^2 + y^2)
x = linspace(-10, 10, 50)
y = linspace(-10, 10, 50)
[X, Y] = meshgrid(x, y)
Z = 1 ./ (1 + X .^ 2 + Y .^ 2)
surf(X, Y, Z)

% z = e^x * cos(y)

x = linspace(-10, 10, 50)
y = linspace(-10, 10, 50)
[X, Y] = meshgrid(x, y)
Z = exp(X) .* cos(Y)
surf(X, Y, Z)

xlabel("x")
ylabel("y")
zlabel("z")
