program main
implicit none
real	::	a1,b1,p1,n,interval
real	::	f
real	::	root
	interval = 0.1
	a1 = 0
call nonlnr_eqn(n,interval,a1,b1,p1,root)
write(*,*)'Root=',root
end program main
