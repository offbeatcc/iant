from math import *

i = 1j


def g(n, k):
    s = 0
    for m in range(0, k):
        s += e**(i * 2 * pi * m * n / k)
    return s

def strc(c):
    return '{:6.3f} + {:6.3f}i'.format(c.real, c.imag)


def main():
    k = 4
    for n in range(0, 2*k + 1):
        print('k = {}; n = {}; g(n) = {}'.format(k, n, strc(g(n, k))))

main()

