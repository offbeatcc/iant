from math import *

# The imaginary unit.
i = 1j

w = e**(i * pi / 3)

# Modulus.
k = 7

# All m such that (m, k) = 1 and 0 < m < k.
m_list = [m for m in range(1, k)]

# Dirichlet character table.
X_list = [
  #  1      2      3      4      5      6     
    [1,     1,     1,     1,     1,     1],  # X_1(m)
    [1,     1,    -1,     1,    -1,    -1],  # X_2(m)
    [1,  w**2,     w,    -w, -w**2,    -1],  # X_3(m)
    [1,  w**2,    -w,    -w,  w**2,     1],  # X_4(m)
    [1,    -w,  w**2,  w**2,    -w,     1],  # X_5(m)
    [1,    -w, -w**2,  w**2,     w,    -1],  # X_6(m)
]

# Gauss sum.
def G(n, X):
    x = e**(i * 2 * pi * n/ k)
    s = 0
    for m, Xm in zip(m_list, X):
        s += Xm * x**m
    return s

# Gauss sums for each Dirichlet character and n.
for r, X in enumerate(X_list, 1):
    for n in range(1, k + 1):
        s = G(n, X)
        print('G({:2d}, X_{}) = {:6.3f} + {:6.3f}i'.format(n, r, s.real, s.imag))
    print()
