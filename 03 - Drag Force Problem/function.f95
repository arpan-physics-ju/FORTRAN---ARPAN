module fun
real function fx1(v)
		real	::v
		fx1 = (-100*v)
end function

real function fy1(v)
		real	::v
		fy1 = (-(10 * v) - (9.8))
end function 

real function f2(v)
		real	::v
		f2 = v 
end function

end module fun
