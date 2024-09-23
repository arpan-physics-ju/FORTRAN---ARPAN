! Harmonic oscillation


program ode_solve
	implicit none
	integer	::i
	real	::t,x_t,v_t,h
	open(1,file='data_2.dat',status='unknown')
! Time increment
	h = 0.01			!Sec
! Initial Cond^n
	t = 0			!Sec
	x_t = 0
	v_t = 20
! Calculations
	write(1,*)t,x_t,v_t
	do i=1,1000
		t = t + h
		v_t = (v_t + (h * f1(x_t,v_t)))
		x_t = (x_t + (h * f2(v_t)))
		write(1,*)t,x_t,v_t
	enddo
	
	
	
contains
	real function f1(x,v)
		real	::x,v
		f1 = (-100*x - 10*v**2)
	end function
	real function f2(v)
		real	::v
		f2 = v 
	end function
end program ode_solve
