from math import *

# The imaginary unit.
i = 1j

# Modulus.
p = 7

# Quadratic Gauss Sum
def G(n):
    x = e**(i * 2 * pi * n / p)
    s = 0
    for r in range(1, p + 1):
        s += x**(r**2)
    return s

# Gauss sums for each Dirichlet character and n.

for n in range(1, p + 1):
    s = G(n)
    print('G({}; {}) = {:6.3f} + {:6.3f}i'.format(n, p, s.real, s.imag))

