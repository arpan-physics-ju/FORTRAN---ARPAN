subroutine ode(t,x_t,v_t,h)
	implicit none
	real	::t,x_t,v_t,h
		t = t + h
		v_t = (v_t + (h * f1(x_t,v_t)))
		x_t = (x_t + (h * f2(v_t)))
end subroutine ode
