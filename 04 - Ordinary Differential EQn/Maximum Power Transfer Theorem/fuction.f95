real function f(x)
implicit none
real::E,R_i,R_l
f = (((E / (R_i + R_l))**2) - ((2 * (E ** 2) * R_l) / ((R_i + R_l) ** 3)))
end function
