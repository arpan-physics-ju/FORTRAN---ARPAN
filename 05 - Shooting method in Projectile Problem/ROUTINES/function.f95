real function f(x)
implicit none
real::x
real::u,range,g

u = 1       !Km/s
range = 100 !Km
g = 0.0098  !Km/s3
f=((((u ** 2) * ( sin(x) )) / (g)) - (range))
end function