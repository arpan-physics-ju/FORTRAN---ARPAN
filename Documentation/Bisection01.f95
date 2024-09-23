subroutine nonlnr_eqn(n,interval,a1,b1,p1,root)
integer	::n
real	::a1, b1, p1, root
1	b1 =a1 + interval 	! interval value depends on problem
	n = 0				! Variable to get relief from Infinte Loop
	if ( (f(a1) * f(b1)) > 0.0) then
		a1 = b1
		goto 1
	else
2		p1 = ((a1 + b1) / 2)
		n = n + 1
		if(n == 100)then
			write(*,*)"Infinite loop..."
			stop
		endif
		if(abs(f(p1)) < 0.001)then
			root = p1   ! This is the Solution
			goto 3
		else
			if(f(p1) < 0)then
				a1 = p1
				goto 2
			else
				b1 = p1
				goto 2
			endif
		endif
	endif
3	continue
end subroutine
