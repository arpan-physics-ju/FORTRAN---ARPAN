! Subject: To study 'Euler Algorithm'
! Writer: Arpan Purkait
! Date: May 8, 2024
! ****************************************************
program ode_solve
	implicit none
	integer	::i
	real	::E,R_i,R_l,h,P_n
	open(1,file='data.dat',status='unknown')
! Constants
	E = 200			!volt
	R_i = 1000		!Ohm
! Time increment
	h = 0.1		!Sec
! Initial Cond^n
	R_l = 0
	P_n = f(E,R_i,R_l)
! Calculations
	write(1,*)R_l, P_n
	do i=1,50000
		R_l = R_l + h
		P_n = (P_n + (h * f(E,R_i,R_l)))
		write(1,*)R_l, P_n
	enddo
contains
	real function f(E,R_i,R_l)
		real::E,R_i,R_l
		f = (((E / (R_i + R_l))**2) - ((2 * (E ** 2) * R_l) / ((R_i + R_l) ** 3)))
	end function
end program ode_solve
