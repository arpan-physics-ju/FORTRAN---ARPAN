program oscillator
    implicit none
    integer::i
    real::gama,omgsq,h,t,x_t,v_t,f1,f2,f3
    open(1, file="Force.dat", status="unknown")
    ! Gamma and Ommega_sq
        gama = 0.05
        omgsq = 10.0
    ! Time increment
	    h = 0.01		!Sec
    ! Initial Cond^n
        t = 0			!Sec
        x_t = 0         !cm
        v_t = 1         !cm/sec
        write(1,*)t,x_t,v_t
        do i = 1, 500
            t = t + h
            x_t = x_t + (h * (f1(v_t)))
            v_t = v_t + (h * (f2(x_t,omgsq)))
            write(1,*)t,x_t,v_t
        enddo
        do i = 1, 2000
            t = t + h
            x_t = x_t + (h * (f1(v_t)))
            v_t = v_t + (h * (f3(x_t,omgsq,t)))
            write(1,*)t,x_t,v_t
        enddo
end program oscillator


real function f1(v)
    real::v
    f1 = v
end function f1
real function f2(x,omgsq)
    real::x,v,gama,omgsq
    f2 = (-1 * (omgsq * x))
end function f2
real function f3(x,omgsq,t)
    real::x,v,gama,omgsq
    f3 = ((-1 * (omgsq * x)))  + (200 * cos(2200 * t))
end function f3