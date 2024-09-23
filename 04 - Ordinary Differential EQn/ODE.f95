! Subject: To study 'Euler Algorithm'
! Writer: Arpan Purkait
! Date: May 8, 2024
! ****************************************************
program ode_solve
	implicit none
	integer	::i
	real	::R,V,L,h,i_n,t
	open(1,file='data.dat',status='unknown')
! Constants
	R = 7.5			!Ohm
	V = 15.0 		!volt
	L = 0.15		!Henrry
! Time increment
	h = 0.01		!Sec
! Initial Cond^n
	t = 0			!Sec
	i_n = 0			!Amp
! Calculations
	write(1,*)t,i_n
	do i=1,100
		t = t + h
		i_n = (i_n + (h * f(R,V,L,i_n)))
		write(1,*)t,i_n
	enddo
contains
	real function f(R,V,L,i_n)
		real	::R,V,L,i_n
		f = ((V - (i_n * R)) / L)
	end function
end program ode_solve
