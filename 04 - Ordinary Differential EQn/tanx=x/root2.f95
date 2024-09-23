program fx
implicit none
real	::	x1,x2,x3,n,interval
real	::	f
real	::	root
	interval=1
	x1=0
call solution_of_non_linear_equation(n,interval,x1,x2,x3,root)
write(*,*)'Root=',root
end program fx
