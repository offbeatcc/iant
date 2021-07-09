import itertools
import math

p = 5
q = 3
p_residues = [n ** 2 for n in range(1, int((p - 1)/2 + 1))]
r_values = list(range(1, p + 1))  # r_values = [1, ..., p]

print('Quadratic residues:', p_residues)

def legendre(n):
    if n % p == 0:
        return 0
    elif n in p_residues:
        return 1
    else:
        return -1
    
legendre_prod_sum = 0

for r_choices in itertools.product(r_values, repeat=q):
    sum_r_choices = sum(r_choices)
    sum_r_choices_mod_p = sum_r_choices % p
    if sum(r_choices) % p == q:
        legendre_prod = legendre(math.prod(r_choices))
        legendre_prod_sum += legendre_prod
        print('{} = {} (mod {});  ({} | {}) = {}'
              .format(' + '.join(str(r) for r in r_choices),
                      sum_r_choices_mod_p, p,
                      ' * '.join(str(r) for r in r_choices),
                      p, legendre_prod))

print("Sum of all Legendre's symbols: {}".format(legendre_prod_sum))
print("Sum of all Legendre's symbols modulo {}: {}".format(q, legendre_prod_sum % q))
