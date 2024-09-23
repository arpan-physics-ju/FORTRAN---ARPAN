program oscillator
    implicit none
    integer::i
    real::gama,omgsq,h,t,x_t,v_t,f1,f2,f3
    open(1, file="Force.dat", status="unknown")
    ! Gamma and Ommega_sq
        gama = 1.0
        omgsq = 80.0
    ! Time increment
	    h = 0.001		!Sec
    ! Initial Cond^n
        t = 0			!Sec
        x_t = 0         !cm
        v_t = 1         !cm/sec
        write(1,*)t,x_t,v_t
        do i = 1, 20000
            t = t + h
            v_t = v_t + (h * (f3(x_t,omgsq,t)))
            x_t = x_t + (h * (f1(v_t)))
            write(1,*)t,x_t,v_t
        enddo
end program oscillator


real function f1(v)
    real::v
    f1 = v
end function f1
real function f3(x,omgsq,t)
    real::x,v,gama,omgsq,om
    om = 17.776
    f3 = ((80 * cos(om * t)) - (gama * v) - (omgsq * x))
end function f3
