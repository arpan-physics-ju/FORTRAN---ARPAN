program main
implicit none
integer :: i
real	::	a1,b1,p1,n,interval
real	::	f
real	::	root
    interval = 0.0
do i = 1, 10
	interval = interval + 0.1
	a1 = 0
call nonlnr_eqn(n,interval,a1,b1,p1,root)
write(*,*)i,'.', interval,root
enddo
end program main
