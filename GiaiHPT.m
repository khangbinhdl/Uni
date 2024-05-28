syms x y z t
pt_1 = x + 2*y - 3*z + 5*t == 0
pt_2 = x + 3*y - 13*z + 22*t == 0
pt_3 = 3*x + 5*y + z - 2*t == 0
pt_4 = 2*x + 3*y + 4*z - 7*t == 0

N = solve([pt_1, pt_2, pt_3, pt_4], [x, y, z, t]);
N.x
N.y
N.z
N.t